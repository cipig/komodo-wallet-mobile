import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart' hide TextStyle;
import 'package:intl/intl.dart';
import '../../model/cex_provider.dart';
import '../../utils/utils.dart';
import 'dart:developer' as developer;

class CandleChart extends StatefulWidget {
  const CandleChart({
    this.data,
    this.duration,
    this.candleWidth = 8,
    this.strokeWidth = 1,
    this.textColor = const Color.fromARGB(200, 255, 255, 255),
    this.gridColor = const Color.fromARGB(50, 255, 255, 255),
    this.upColor = Colors.green,
    this.downColor = Colors.red,
    this.filled = true,
    this.quoted = false,
  });

  final List<CandleData> data;
  final int duration; // sec
  final double candleWidth;
  final double strokeWidth;
  final Color textColor;
  final Color upColor;
  final Color downColor;
  final bool filled;
  final bool quoted;
  final Color gridColor;

  @override
  CandleChartState createState() => CandleChartState();
}

class CandleChartState extends State<CandleChart>
    with TickerProviderStateMixin {
  double timeAxisShift = 0;
  double prevTimeAxisShift = 0;
  double dynamicZoom;
  double staticZoom;
  Offset tapDownPosition;
  int touchCounter = 0;
  double maxTimeShift;
  Size canvasSize;
  Offset tapPosition;
  Map<String, dynamic> selectedPoint; // {'timestamp': int, 'price': double}
  int scrollDragFactor = 5;

  @override
  void initState() {
    dynamicZoom = 1;
    staticZoom = 1;

    super.initState();
  }

  @override
  void didUpdateWidget(CandleChart oldWidget) {
    if (oldWidget.quoted != widget.quoted) {
      selectedPoint = null;
    }
    if (oldWidget.duration != widget.duration) {
      timeAxisShift = 0;
      staticZoom = 1;
      dynamicZoom = 1;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double _constrainedTimeShift(double timeShift) {
      final double maxTimeShiftValue = maxTimeShift ?? timeShift;
      return timeShift.clamp(0.0, maxTimeShiftValue);
    }

    double _constrainedZoom(double scale) {
      double constrained = scale;

      final double maxZoom = canvasSize.width / 5 / widget.candleWidth;
      if (staticZoom * scale > maxZoom) {
        constrained = maxZoom / staticZoom;
      }
      final double minZoom = canvasSize.width / 500 / widget.candleWidth;
      if (staticZoom * scale < minZoom) {
        constrained = minZoom / staticZoom;
      }

      return constrained;
    }

    return SizedBox(
      child: Listener(
        onPointerDown: (_) {
          setState(() {
            touchCounter++;
          });
        },
        onPointerUp: (_) {
          setState(() {
            touchCounter--;
          });
        },
        child: GestureDetector(
          onHorizontalDragUpdate: (DragUpdateDetails drag) {
            if (touchCounter > 1) {
              return;
            }

            setState(() {
              timeAxisShift = _constrainedTimeShift(
                timeAxisShift +
                    drag.delta.dx / scrollDragFactor / staticZoom / dynamicZoom,
              );
            });
          },
          onScaleStart: (_) {
            setState(() {
              prevTimeAxisShift = timeAxisShift;
            });
          },
          onScaleEnd: (_) {
            setState(() {
              staticZoom = staticZoom * dynamicZoom;
              dynamicZoom = 1;
            });
          },
          onScaleUpdate: (ScaleUpdateDetails scale) {
            setState(() {
              dynamicZoom = _constrainedZoom(scale.scale);
              timeAxisShift = _constrainedTimeShift(
                prevTimeAxisShift -
                    canvasSize.width /
                        2 *
                        (1 - dynamicZoom) /
                        (staticZoom * dynamicZoom),
              );
            });
          },
          onTapDown: (TapDownDetails details) {
            tapPosition = null;

            setState(() {
              tapDownPosition = details.localPosition;
            });
          },
          onTap: () {
            tapPosition = tapDownPosition;
          },
          child: CustomPaint(
            painter: _ChartPainter(
              widget: widget,
              timeAxisShift: timeAxisShift,
              zoom: staticZoom * dynamicZoom,
              tapPosition: tapPosition,
              selectedPoint: selectedPoint,
              setWidgetState: (String prop, dynamic value) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    switch (prop) {
                      case 'maxTimeShift':
                        {
                          maxTimeShift = value;
                          break;
                        }
                      case 'canvasSize':
                        {
                          canvasSize = value;
                          break;
                        }
                      case 'tapPosition':
                        {
                          tapPosition = value;
                          break;
                        }
                      case 'selectedPoint':
                        {
                          selectedPoint = value;
                          break;
                        }
                    }
                  });
                });
              },
            ),
            child: Center(
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  _ChartPainter({
    @required this.widget,
    this.timeAxisShift = 0,
    this.zoom = 1,
    this.tapPosition,
    this.selectedPoint,
    this.setWidgetState,
  }) {
    painter = Paint()
      ..style = widget.filled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = widget.strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  final CandleChart widget;
  final double timeAxisShift;
  final double zoom;
  final Offset tapPosition;
  final Map<String, dynamic> selectedPoint;
  final Function(String, dynamic) setWidgetState;

  Paint painter;
  final double pricePaddingPercent = 15;
  final double pricePreferredDivisions = 4;
  final double gap = 2;
  final double marginTop = 14;
  final double marginBottom = 30;
  final double labelWidth = 100;
  final int visibleCandlesLimit = 100;

  @override
  void paint(Canvas canvas, Size size) {
    setWidgetState('canvasSize', size);
    final double fieldHeight = size.height - marginBottom - marginTop;
    final List<CandleData> visibleCandlesData = <CandleData>[];
    double minPrice = double.infinity;
    double maxPrice = 0;

    // adjust time axis
    final int maxVisibleCandles =
        (size.width / (widget.candleWidth + gap) / zoom)
            .floor()
            .clamp(0, visibleCandlesLimit);
    final int firstCandleIndex =
        timeAxisShift.floor().clamp(0, widget.data.length - maxVisibleCandles);
    final int lastVisibleCandleIndex = (firstCandleIndex + maxVisibleCandles)
        .clamp(maxVisibleCandles - 1, widget.data.length - 1);

    final int firstCandleCloseTime = widget.data[firstCandleIndex].closeTime;
    final int lastCandleCloseTime =
        widget.data[lastVisibleCandleIndex].closeTime;
    final int timeRange = firstCandleCloseTime - lastCandleCloseTime;
    final double timeScaleFactor = size.width / timeRange;
    setWidgetState(
      'maxTimeShift',
      (widget.data.length - maxVisibleCandles).toDouble(),
    );
    final double timeAxisMax = firstCandleCloseTime - zoom / timeScaleFactor;
    final double timeAxisMin = timeAxisMax - timeRange;

    // Collect visible candles data
    for (int i = firstCandleIndex; i < lastVisibleCandleIndex; i++) {
      final CandleData candle = widget.data[i];
      final double dx = (candle.closeTime - timeAxisMin) * timeScaleFactor;
      if (dx > size.width + widget.candleWidth * zoom) {
        continue;
      }
      if (dx.isNegative) {
        break;
      }

      final double lowPrice = _price(candle.lowPrice);
      final double highPrice = _price(candle.highPrice);
      if (lowPrice < minPrice) {
        minPrice = lowPrice;
      }
      if (highPrice > maxPrice) {
        maxPrice = highPrice;
      }

      visibleCandlesData.add(candle);
    }

    // adjust price axis
    final double priceRange = maxPrice - minPrice;
    final double priceAxis =
        priceRange + (2 * priceRange * pricePaddingPercent / 100);
    final double priceScaleFactor = fieldHeight / priceAxis;
    final double priceDivision =
        _priceDivision(priceAxis, pricePreferredDivisions);
    final double originPrice =
        ((minPrice - (priceRange * pricePaddingPercent / 100)) / priceDivision)
                .round() *
            priceDivision;

    // returns dy for given price
    double _price2dy(double price) {
      return size.height -
          marginBottom -
          ((price - originPrice) * priceScaleFactor);
    }

    // returns dx for given time
    double _time2dx(int time) {
      return (time.toDouble() - timeAxisMin) * timeScaleFactor -
          (widget.candleWidth + gap) * zoom / 2;
    }

    // calculate candles position
    final Map<int, CandlePosition> candlesToRender = {};
    for (final CandleData candle in visibleCandlesData) {
      final double dx = _time2dx(candle.closeTime);

      final double top =
          _price2dy(max(_price(candle.closePrice), _price(candle.openPrice)));
      double bottom =
          _price2dy(min(_price(candle.closePrice), _price(candle.openPrice)));
      if (bottom - top < widget.strokeWidth) {
        bottom = top + widget.strokeWidth;
      }

      candlesToRender[candle.closeTime] = CandlePosition(
        color: _price(candle.closePrice) < _price(candle.openPrice)
            ? widget.downColor
            : widget.upColor,
        high: Offset(dx, _price2dy(_price(candle.highPrice))),
        low: Offset(dx, _price2dy(_price(candle.lowPrice))),
        left: dx - widget.candleWidth * zoom / 2,
        right: dx + widget.candleWidth * zoom / 2,
        top: top,
        bottom: bottom,
      );
    }

    // draw candles
    candlesToRender.forEach((int timeStamp, CandlePosition candle) {
      _drawCandle(canvas, painter, candle);
    });

    // draw price grid
    final int visibleDivisions =
        (size.height / (priceDivision * priceScaleFactor)).floor() + 1;
    for (int i = 0; i < visibleDivisions; i++) {
      painter.color = widget.gridColor;
      final double price = originPrice + i * priceDivision;
      final double dy = _price2dy(price);
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), painter);
      final String formattedPrice = formatPrice(price, 8);
      painter.color = widget.textColor;

      // This is to skip the first price label, which is the origin price.
      if (i < 1) {
        continue;
      }
      _drawText(
        canvas: canvas,
        point: Offset(4, dy),
        text: formattedPrice,
        color: widget.textColor,
        align: TextAlign.start,
        width: labelWidth,
      );
    }

    //draw current price
    final double currentPrice =
        _price(widget.data[firstCandleIndex].closePrice);
    double currentPriceDy = _price2dy(currentPrice);
    bool outside = false;
    if (currentPriceDy > size.height - marginBottom) {
      outside = true;
      currentPriceDy = size.height - marginBottom;
    }
    if (currentPriceDy < size.height - marginBottom - fieldHeight) {
      outside = true;
      currentPriceDy = size.height - marginBottom - fieldHeight;
    }
    final Color currentPriceColor = outside
        ? const Color.fromARGB(120, 200, 200, 150)
        : const Color.fromARGB(255, 200, 200, 150);
    painter.color = currentPriceColor;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, currentPriceDy),
        Offset(startX + 5, currentPriceDy),
        painter,
      );
      startX += 10;
    }

    _drawText(
      canvas: canvas,
      point: Offset(size.width - labelWidth - 2, currentPriceDy - 2),
      text: ' ${formatPrice(currentPrice, 8)} ',
      color: Colors.black,
      backgroundColor: currentPriceColor,
      align: TextAlign.end,
      width: labelWidth,
    );

    // draw time grid
    double rightMarkerPosition = size.width;
    if (timeAxisShift < 0) {
      rightMarkerPosition = rightMarkerPosition -
          (widget.candleWidth / 2 + gap / 2 - timeAxisShift) * zoom;
    }
    _drawText(
      canvas: canvas,
      color: widget.textColor,
      point: Offset(
        rightMarkerPosition - labelWidth - 4,
        size.height - 7,
      ),
      text: _formatTime(visibleCandlesData.first.closeTime),
      align: TextAlign.end,
      width: labelWidth,
    );
    _drawText(
      canvas: canvas,
      color: widget.textColor,
      point: Offset(
        4,
        size.height - 7,
      ),
      text: _formatTime(visibleCandlesData.last.closeTime),
      align: TextAlign.start,
      width: labelWidth,
    );
    painter.color = widget.gridColor;
    for (final CandleData candleData in visibleCandlesData) {
      final double dx = _time2dx(candleData.closeTime);
      canvas.drawLine(
        Offset(dx, size.height - marginBottom),
        Offset(dx, size.height - marginBottom + 5),
        painter,
      );
    }
    painter.color = widget.textColor;
    canvas.drawLine(
      Offset(0, size.height - marginBottom),
      Offset(0, size.height - marginBottom + 5),
      painter,
    );
    canvas.drawLine(
      Offset(rightMarkerPosition, size.height - marginBottom),
      Offset(rightMarkerPosition, size.height - marginBottom + 5),
      painter,
    );

    // select point on Tap
    if (tapPosition != null) {
      setWidgetState('selectedPoint', null);
      double minDistance;
      for (final CandleData candle in visibleCandlesData) {
        final List<double> prices = [
          _price(candle.openPrice),
          _price(candle.closePrice),
          _price(candle.highPrice),
          _price(candle.lowPrice),
        ].toList();

        for (final double price in prices) {
          final double distance = sqrt(
            pow(tapPosition.dx - _time2dx(candle.closeTime), 2) +
                pow(tapPosition.dy - _price2dy(price), 2),
          );
          if (distance > 30) {
            continue;
          }
          if (minDistance != null && distance > minDistance) {
            continue;
          }

          minDistance = distance;
          setWidgetState('selectedPoint', <String, dynamic>{
            'timestamp': candle.closeTime,
            'price': price,
          });
        }
      }
      setWidgetState('tapPosition', null);
    }

    // draw selected point
    if (selectedPoint != null) {
      CandleData selectedCandle;
      try {
        selectedCandle = visibleCandlesData.firstWhere((CandleData candle) {
          return candle.closeTime == selectedPoint['timestamp'];
        });
      } catch (_) {}

      if (selectedCandle != null) {
        const double radius = 3;
        final double dx = _time2dx(selectedCandle.closeTime);
        final double dy = _price2dy(selectedPoint['price']);
        painter.style = PaintingStyle.stroke;

        canvas.drawCircle(Offset(dx, dy), radius, painter);

        double startX = dx + radius;
        while (startX < size.width) {
          canvas.drawLine(Offset(startX, dy), Offset(startX + 5, dy), painter);
          startX += 10;
        }

        _drawText(
          canvas: canvas,
          align: TextAlign.right,
          color: widget.textColor == Colors.black ? Colors.white : Colors.black,
          backgroundColor: widget.textColor,
          text: ' ${formatPrice(selectedPoint['price'], 8)} ',
          point: Offset(size.width - labelWidth - 2, dy - 2),
          width: labelWidth,
        );

        double startY = dy + radius;
        while (startY < size.height - marginBottom + 10) {
          canvas.drawLine(Offset(dx, startY), Offset(dx, startY + 5), painter);
          startY += 10;
        }

        _drawText(
          canvas: canvas,
          align: TextAlign.center,
          color: widget.textColor == Colors.black ? Colors.white : Colors.black,
          backgroundColor: widget.textColor,
          text: ' ${_formatTime(selectedCandle.closeTime)} ',
          point: Offset(dx - 50, size.height - 7),
          width: labelWidth,
        );
      }
    }
  } // paint

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final _ChartPainter old = oldDelegate as _ChartPainter;

    return timeAxisShift != old.timeAxisShift ||
        zoom != old.zoom ||
        selectedPoint != old.selectedPoint ||
        tapPosition != old.tapPosition ||
        widget.data.length != old.widget.data.length;
  }

  double _priceDivision(double range, double divisions) {
    return range / divisions;
  }

  void _drawCandle(Canvas canvas, Paint paint, CandlePosition candle) {
    paint.color = candle.color;

    final Rect rect = Rect.fromLTRB(
      candle.left,
      candle.top,
      candle.right,
      candle.bottom,
    );

    canvas.drawLine(
      candle.high,
      Offset(candle.high.dx, candle.top),
      paint,
    );
    canvas.drawRect(rect, paint);
    canvas.drawLine(
      Offset(candle.low.dx, candle.bottom),
      candle.low,
      paint,
    );
  }

  double _price(double price) {
    if (widget.quoted) {
      return 1 / price;
    }
    return price;
  }

  String _formatTime(int millisecondsSinceEpoch) {
    final DateTime utc = DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch,
      isUtc: true,
    );

    const String format = 'MMM dd yyyy HH:mm';
    return DateFormat(format).format(utc);
  }

  void _drawText({
    Canvas canvas,
    Offset point,
    String text,
    Color color,
    Color backgroundColor = Colors.transparent,
    TextAlign align,
    double width,
  }) {
    final ParagraphBuilder builder =
        ParagraphBuilder(ParagraphStyle(textAlign: align))
          ..pushStyle(
            TextStyle(
              color: color,
              fontSize: 10,
              background: Paint()..color = backgroundColor,
            ),
          )
          ..addText(text);
    final Paragraph paragraph = builder.build()
      ..layout(ParagraphConstraints(width: width));
    canvas.drawParagraph(
      paragraph,
      Offset(point.dx, point.dy - paragraph.height),
    );
  }
}

class CandlePosition {
  CandlePosition({
    this.color,
    this.high,
    this.low,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  Color color;
  Offset high;
  Offset low;
  double top;
  double bottom;
  double left;
  double right;
}
