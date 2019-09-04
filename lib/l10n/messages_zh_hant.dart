// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_hant locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final MessageLookup messages = new MessageLookup();

// ignore: unused_element
final String _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent = void Function(String message_str, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'zh_hant';

  static dynamic m0(dynamic name) => '成功新增 ${name}!';

  static dynamic m9(dynamic seconde) => '訂單匹配中, 請稍等 ${seconde} 秒!';

  static dynamic m1(dynamic index) => '請輸入第 ${index}. 個字';

  static dynamic m2(dynamic index) => '您助記詞的第 ${index}. 個字是什麼？';

  static dynamic m10(dynamic coinName, dynamic number) =>
      '最低可賣出數量 ${number} ${coinName}';

  static dynamic m11(dynamic coinName, dynamic number) =>
      '最低可買入數量 ${number} ${coinName}';

  static dynamic m3(dynamic coinName) => '當前無 ${coinName} 匹配訂單 - 請稍後再試, 或建立訂單。';

  static dynamic m4(dynamic assets) => '${assets} 資產';

  static dynamic m5(dynamic amount) => '點擊查看${amount}訂單';

  static dynamic m6(dynamic coinName, dynamic address) =>
      '我的 ${coinName} 地址: \\n${address}';

  static dynamic m7(dynamic amount, dynamic coinName) =>
      '提領${amount} ${coinName}';

  static dynamic m8(dynamic amount, dynamic coin) => '您將收到${amount} ${coin}';

  @override
  final Map<String, dynamic> messages =
      _notInlinedMessages(_notInlinedMessages);

  static dynamic _notInlinedMessages(dynamic _) => <String, Function>{
        'accepteula':
            MessageLookupByLibrary.simpleMessage('同意接受終端使用者授權協議 (EULA)'),
        'accepttac': MessageLookupByLibrary.simpleMessage('接受條款與條件'),
        'activateAccessBiometric':
            MessageLookupByLibrary.simpleMessage('開啟生物識別功能'),
        'activateAccessPin': MessageLookupByLibrary.simpleMessage('啟動PIN碼保護'),
        'addCoin': MessageLookupByLibrary.simpleMessage('新增代幣'),
        'addingCoinSuccess': m0,
        'addressSend': MessageLookupByLibrary.simpleMessage('收款人錢包地址'),
        'allowCustomSeed': MessageLookupByLibrary.simpleMessage('允許自訂助記詞'),
        'amount': MessageLookupByLibrary.simpleMessage('數量'),
        'amountToSell': MessageLookupByLibrary.simpleMessage('欲出售數量'),
        'appName': MessageLookupByLibrary.simpleMessage('atomicDEX'),
        'areYouSure': MessageLookupByLibrary.simpleMessage('您確定嗎？'),
        'articleFrom': MessageLookupByLibrary.simpleMessage('AtomicDEX 新聞'),
        'availableVolume': MessageLookupByLibrary.simpleMessage('最大卷'),
        'back': MessageLookupByLibrary.simpleMessage('上一步'),
        'backupTitle': MessageLookupByLibrary.simpleMessage('備份'),
        'bestAvailableRate': MessageLookupByLibrary.simpleMessage('當前最佳匯率'),
        'buy': MessageLookupByLibrary.simpleMessage('買'),
        'buySuccessWaiting':
            MessageLookupByLibrary.simpleMessage('兌換需求發布, 請稍後！'),
        'buySuccessWaitingError': m9,
        'cancel': MessageLookupByLibrary.simpleMessage('取消'),
        'changePin': MessageLookupByLibrary.simpleMessage('變更PIN碼'),
        'checkOut': MessageLookupByLibrary.simpleMessage('Check Out'),
        'checkSeedPhrase': MessageLookupByLibrary.simpleMessage('請確認助記詞'),
        'checkSeedPhraseButton1': MessageLookupByLibrary.simpleMessage('繼續'),
        'checkSeedPhraseButton2':
            MessageLookupByLibrary.simpleMessage('返回並再次檢查'),
        'checkSeedPhraseHint': m1,
        'checkSeedPhraseInfo': MessageLookupByLibrary.simpleMessage(
            '您的助記詞是很重要的所以我們要確認您有正確備份。我們將問您三個有關您的助記詞的問題以確保您可以隨時恢復錢包。'),
        'checkSeedPhraseSubtile': m2,
        'checkSeedPhraseTitle':
            MessageLookupByLibrary.simpleMessage('請再次確認助記詞'),
        'claim': MessageLookupByLibrary.simpleMessage('領取'),
        'claimTitle': MessageLookupByLibrary.simpleMessage('領取您的KMD獎勵？'),
        'clickToSee': MessageLookupByLibrary.simpleMessage('點擊查看'),
        'clipboard': MessageLookupByLibrary.simpleMessage('已複制'),
        'clipboardCopy': MessageLookupByLibrary.simpleMessage('已複制'),
        'close': MessageLookupByLibrary.simpleMessage('關閉'),
        'code': MessageLookupByLibrary.simpleMessage('Code: '),
        'comingSoon': MessageLookupByLibrary.simpleMessage(' 即將上線，敬請期待。。。'),
        'commingsoon': MessageLookupByLibrary.simpleMessage('交易明細載入中！'),
        'commingsoonGeneral': MessageLookupByLibrary.simpleMessage('細節戴入中！'),
        'commissionFee': MessageLookupByLibrary.simpleMessage('成交費用'),
        'confirm': MessageLookupByLibrary.simpleMessage('確認'),
        'confirmPassword': MessageLookupByLibrary.simpleMessage('確認密碼'),
        'confirmPin': MessageLookupByLibrary.simpleMessage('確認PIN碼'),
        'confirmSeed': MessageLookupByLibrary.simpleMessage('確認助記詞'),
        'confirmeula': MessageLookupByLibrary.simpleMessage(
            '我了解點擊以下的按鈕，即表示我已閱讀及接受終端使用者授權協議(EULA) & 使用條款與條件 。'),
        'connecting': MessageLookupByLibrary.simpleMessage('串接中。。。'),
        'create': MessageLookupByLibrary.simpleMessage('交易'),
        'createAWallet': MessageLookupByLibrary.simpleMessage('創建錢包'),
        'createPin': MessageLookupByLibrary.simpleMessage('創建PIN碼'),
        'decryptingWallet': MessageLookupByLibrary.simpleMessage('錢包解密中'),
        'delete': MessageLookupByLibrary.simpleMessage('刪除'),
        'deleteWallet': MessageLookupByLibrary.simpleMessage('刪除錢包'),
        'dex': MessageLookupByLibrary.simpleMessage('DEX'),
        'disclaimerAndTos': MessageLookupByLibrary.simpleMessage('免責聲明 & 使用條款'),
        'done': MessageLookupByLibrary.simpleMessage('完成'),
        'dontWantPassword': MessageLookupByLibrary.simpleMessage('我不想要使用密碼'),
        'encryptingWallet': MessageLookupByLibrary.simpleMessage('錢包加密中'),
        'enterPinCode': MessageLookupByLibrary.simpleMessage('輸入您的PIN碼'),
        'enterSeedPhrase': MessageLookupByLibrary.simpleMessage('輸入助記詞'),
        'enterpassword': MessageLookupByLibrary.simpleMessage('繼續前請輸入密碼。'),
        'errorAmountBalance': MessageLookupByLibrary.simpleMessage('餘額不足'),
        'errorNotAValidAddress': MessageLookupByLibrary.simpleMessage('錢包地址錯誤'),
        'errorTryAgain': MessageLookupByLibrary.simpleMessage('失敗, 請再重新操作一次'),
        'errorTryLater': MessageLookupByLibrary.simpleMessage('發生了錯誤，請稍後再試'),
        'errorValueEmpty': MessageLookupByLibrary.simpleMessage('金額太高或低'),
        'errorValueNotEmpty': MessageLookupByLibrary.simpleMessage('請輸入資料'),
        'estimateValue': MessageLookupByLibrary.simpleMessage('預估總金額'),
        'ethFee': MessageLookupByLibrary.simpleMessage('ETH fee\n'),
        'ethNotActive': MessageLookupByLibrary.simpleMessage('請激活ETH。'),
        'eulaParagraphe1': MessageLookupByLibrary.simpleMessage(
            'This End-User License Agreement (\'EULA\') is a legal agreement between you and Komodo Platform.\n\nThis EULA agreement governs your acquisition and use of our atomicDEX mobile software (\'Software\', \'Mobile Application\', \'Application\' or \'App\') directly from Komodo Platform or indirectly through a Komodo Platform authorized entity, reseller or distributor (a \'Distributor\').\nPlease read this EULA agreement carefully before completing the installation process and using the atomicDEX mobile software. It provides a license to use the atomicDEX mobile software and contains warranty information and liability disclaimers.\nIf you register for the beta program of the atomicDEX mobile software, this EULA agreement will also govern that trial. By clicking \'accept\' or installing and/or using the atomicDEX mobile software, you are confirming your acceptance of the Software and agreeing to become bound by the terms of this EULA agreement.\nIf you are entering into this EULA agreement on behalf of a company or other legal entity, you represent that you have the authority to bind such entity and its affiliates to these terms and conditions. If you do not have such authority or if you do not agree with the terms and conditions of this EULA agreement, do not install or use the Software, and you must not accept this EULA agreement.\nThis EULA agreement shall apply only to the Software supplied by Komodo Platform herewith regardless of whether other software is referred to or described herein. The terms also apply to any Komodo Platform updates, supplements, Internet-based services, and support services for the Software, unless other terms accompany those items on delivery. If so, those terms apply.\nLicense Grant\nKomodo Platform hereby grants you a personal, non-transferable, non-exclusive licence to use the atomicDEX mobile software on your devices in accordance with the terms of this EULA agreement.\n\nYou are permitted to load the atomicDEX mobile software (for example a PC, laptop, mobile or tablet) under your control. You are responsible for ensuring your device meets the minimum security and resource requirements of the atomicDEX mobile software.\nYou are not permitted to:\nEdit, alter, modify, adapt, translate or otherwise change the whole or any part of the Software nor permit the whole or any part of the Software to be combined with or become incorporated in any other software, nor decompile, disassemble or reverse engineer the Software or attempt to do any such things\nReproduce, copy, distribute, resell or otherwise use the Software for any commercial purpose\nUse the Software in any way which breaches any applicable local, national or international law\nuse the Software for any purpose that Komodo Platform considers is a breach of this EULA agreement\nIntellectual Property and Ownership\nKomodo Platform shall at all times retain ownership of the Software as originally downloaded by you and all subsequent downloads of the Software by you. The Software (and the copyright, and other intellectual property rights of whatever nature in the Software, including any modifications made thereto) are and shall remain the property of Komodo Platform.\n\nKomodo Platform reserves the right to grant licences to use the Software to third parties.\nTermination\nThis EULA agreement is effective from the date you first use the Software and shall continue until terminated. You may terminate it at any time upon written notice to Komodo Platform.\nIt will also terminate immediately if you fail to comply with any term of this EULA agreement. Upon such termination, the licenses granted by this EULA agreement will immediately terminate and you agree to stop all access and use of the Software. The provisions that by their nature continue and survive will survive any termination of this EULA agreement.\nGoverning Law\nThis EULA agreement, and any dispute arising out of or in connection with this EULA agreement, shall be governed by and construed in accordance with the laws of Vietnam.\n\nThis document was last updated on July 3, 2019'),
        'eulaParagraphe10': MessageLookupByLibrary.simpleMessage(
            'Komodo Platform is the owner and/or authorised user of all trademarks, service marks, design marks, patents, copyrights, database rights and all other intellectual property appearing on or contained within the application, unless otherwise indicated. All information, text, material, graphics, software and advertisements on the application interface are copyright of Komodo Platform, its suppliers and licensors, unless otherwise expressly indicated by Komodo Platform. \nExcept as provided in the Terms, use of the application does not grant You any right, title, interest or license to any such intellectual property You may have access to on the application. \nWe own the rights, or have permission to use, the trademarks listed in our application. You are not authorised to use any of those trademarks without our written authorization – doing so would constitute a breach of our or another party’s intellectual property rights. \nAlternatively, we might authorise You to use the content in our application if You previously contact us and we agree in writing.'),
        'eulaParagraphe11': MessageLookupByLibrary.simpleMessage(
            'Komodo Platform cannot guarantee the safety or security of your computer systems. We do not accept liability for any loss or corruption of electronically stored data or any damage to any computer system occurred in connection with the use of the application or of the user content.\nKomodo Platform makes no representation or warranty of any kind, express or implied, as to the operation of the application or the user content. You expressly agree that your use of the application is entirely at your sole risk.\nYou agree that the content provided in the application and the user content do not constitute financial product, legal or taxation advice, and You agree on not representing the user content or the application as such.\nTo the extent permitted by current legislation, the application is provided on an “as is, as available” basis.\n\nKomodo Platform expressly disclaims all responsibility for any loss, injury, claim, liability, or damage, or any indirect, incidental, special or consequential damages or loss of profits whatsoever resulting from, arising out of or in any way related to: \n(a) any errors in or omissions of the application and/or the user content, including but not limited to technical inaccuracies and typographical errors; \n(b) any third party website, application or content directly or indirectly accessed through links in the application, including but not limited to any errors or omissions; \n(c) the unavailability of the application or any portion of it; \n(d) your use of the application;\n(e) your use of any equipment or software in connection with the application. \nAny Services offered in connection with the Platform are provided on an \'as is\' basis, without any representation or warranty, whether express, implied or statutory. To the maximum extent permitted by applicable law, we specifically disclaim any implied warranties of title, merchantability, suitability for a particular purpose and/or non-infringement. We do not make any representations or warranties that use of the Platform will be continuous, uninterrupted, timely, or error-free.\nWe make no warranty that any Platform will be free from viruses, malware, or other related harmful material and that your ability to access any Platform will be uninterrupted. Any defects or malfunction in the product should be directed to the third party offering the Platform, not to Komodo. \nWe will not be responsible or liable to You for any loss of any kind, from action taken, or taken in reliance on the material or information contained in or through the Platform.\nThis is experimental and unfinished software. Use at your own risk. No warranty for any kind of damage. By using this application you agree to this terms and conditions.'),
        'eulaParagraphe12': MessageLookupByLibrary.simpleMessage(
            'When accessing or using the Services, You agree that You are solely responsible for your conduct while accessing and using our Services. Without limiting the generality of the foregoing, You agree that You will not:\n(a) Use the Services in any manner that could interfere with, disrupt, negatively affect or inhibit other users from fully enjoying the Services, or that could damage, disable, overburden or impair the functioning of our Services in any manner;\n(b) Use the Services to pay for, support or otherwise engage in any illegal activities, including, but not limited to illegal gambling, fraud, money laundering, or terrorist activities;\n(c) Use any robot, spider, crawler, scraper or other automated means or interface not provided by us to access our Services or to extract data;\n(d) Use or attempt to use another user’s Wallet or credentials without authorization;\n(e) Attempt to circumvent any content filtering techniques we employ, or attempt to access any service or area of our Services that You are not authorized to access;\n(f) Introduce to the Services any virus, Trojan, worms, logic bombs or other harmful material;\n(g) Develop any third-party applications that interact with our Services without our prior written consent;\n(h) Provide false, inaccurate, or misleading information; \n(i) Encourage or induce any other person to engage in any of the activities prohibited under this Section.'),
        'eulaParagraphe13': MessageLookupByLibrary.simpleMessage(
            'You agree and understand that there are risks associated with utilizing Services involving Virtual Currencies including, but not limited to, the risk of failure of hardware, software and internet connections, the risk of malicious software introduction, and the risk that third parties may obtain unauthorized access to information stored within your Wallet, including but not limited to your public and private keys. You agree and understand that Komodo Platform will not be responsible for any communication failures, disruptions, errors, distortions or delays You may experience when using the Services, however caused.\nYou accept and acknowledge that there are risks associated with utilizing any virtual currency network, including, but not limited to, the risk of unknown vulnerabilities in or unanticipated changes to the network protocol. You acknowledge and accept that Komodo Platform has no control over any cryptocurrency network and will not be responsible for any harm occurring as a result of such risks, including, but not limited to, the inability to reverse a transaction, and any losses in connection therewith due to erroneous or fraudulent actions.\nThe risk of loss in using Services involving Virtual Currencies may be substantial and losses may occur over a short period of time. In addition, price and liquidity are subject to significant fluctuations that may be unpredictable.\nVirtual Currencies are not legal tender and are not backed by any sovereign government. In addition, the legislative and regulatory landscape around Virtual Currencies is constantly changing and may affect your ability to use, transfer, or exchange Virtual Currencies.\nCFDs are complex instruments and come with a high risk of losing money rapidly due to leverage. 80.6% of retail investor accounts lose money when trading CFDs with this provider. You should consider whether You understand how CFDs work and whether You can afford to take the high risk of losing your money.'),
        'eulaParagraphe14': MessageLookupByLibrary.simpleMessage(
            'You agree to indemnify, defend and hold harmless Komodo Platform, its officers, directors, employees, agents, licensors, suppliers and any third party information providers to the application from and against all losses, expenses, damages and costs, including reasonable lawyer fees, resulting from any violation of the Terms by You.\nYou also agree to indemnify Komodo Platform against any claims that information or material which You have submitted to Komodo Platform is in violation of any law or in breach of any third party rights (including, but not limited to, claims in respect of defamation, invasion of privacy, breach of confidence, infringement of copyright or infringement of any other intellectual property right).'),
        'eulaParagraphe15': MessageLookupByLibrary.simpleMessage(
            'In order to be completed, any Virtual Currency transaction created with the Komodo Platform must be confirmed and recorded in the Virtual Currency ledger associated with the relevant Virtual Currency network. Such networks are decentralized, peer-to-peer networks supported by independent third parties, which are not owned, controlled or operated by Komodo Platform.\nKomodo Platform has no control over any Virtual Currency network and therefore cannot and does not ensure that any transaction details You submit via our Services will be confirmed on the relevant Virtual Currency network. You agree and understand that the transaction details You submit via our Services may not be completed, or may be substantially delayed, by the Virtual Currency network used to process the transaction. We do not guarantee that the Wallet can transfer title or right in any Virtual Currency or make any warranties whatsoever with regard to title.\nOnce transaction details have been submitted to a Virtual Currency network, we cannot assist You to cancel or otherwise modify your transaction or transaction details. Komodo Platform has no control over any Virtual Currency network and does not have the ability to facilitate any cancellation or modification requests.\nIn the event of a Fork, Komodo Platform may not be able to support activity related to your Virtual Currency. You agree and understand that, in the event of a Fork, the transactions may not be completed, completed partially, incorrectly completed, or substantially delayed. Komodo Platform is not responsible for any loss incurred by You caused in whole or in part, directly or indirectly, by a Fork.\nIn no event shall Komodo Platform, its affiliates and service providers, or any of their respective officers, directors, agents, employees or representatives, be liable for any lost profits or any special, incidental, indirect, intangible, or consequential damages, whether based on contract, tort, negligence, strict liability, or otherwise, arising out of or in connection with authorized or unauthorized use of the services, or this agreement, even if an authorized representative of Komodo Platform has been advised of, has known of, or should have known of the possibility of such damages. \nFor example (and without limiting the scope of the preceding sentence), You may not recover for lost profits, lost business opportunities, or other types of special, incidental, indirect, intangible, or consequential damages. Some jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation may not apply to You. \nWe will not be responsible or liable to You for any loss and take no responsibility for damages or claims arising in whole or in part, directly or indirectly from: (a) user error such as forgotten passwords, incorrectly constructed transactions, or mistyped Virtual Currency addresses; (b) server failure or data loss; (c) corrupted or otherwise non-performing Wallets or Wallet files; (d) unauthorized access to applications; (e) any unauthorized activities, including without limitation the use of hacking, viruses, phishing, brute forcing or other means of attack against the Services.'),
        'eulaParagraphe16': MessageLookupByLibrary.simpleMessage(
            'For the avoidance of doubt, Komodo Platform does not provide investment, tax or legal advice, nor does Komodo Platform broker trades on your behalf. All Komodo Platform trades are executed automatically, based on the parameters of your order instructions and in accordance with posted Trade execution procedures, and You are solely responsible for determining whether any investment, investment strategy or related transaction is appropriate for You based on your personal investment objectives, financial circumstances and risk tolerance. You should consult your legal or tax professional regarding your specific situation.Neither Komodo nor its owners, members, officers, directors, partners, consultants, nor anyone involved in the publication of this application, is a registered investment adviser or broker-dealer or associated person with a registered investment adviser or broker-dealer and none of the foregoing make any recommendation that the purchase or sale of crypto-assets or securities of any company profiled in the mobile Application is suitable or advisable for any person or that an investment or transaction in such crypto-assets or securities will be profitable. The information contained in the mobile Application is not intended to be, and shall not constitute, an offer to sell or the solicitation of any offer to buy any crypto-asset or security. The information presented in the mobile Application is provided for informational purposes only and is not to be treated as advice or a recommendation to make any specific investment or transaction. Please, consult with a qualified professional before making any decisions.The opinions and analysis included in this applications are based on information from sources deemed to be reliable and are provided “as is” in good faith. Komodo makes no representation or warranty, expressed, implied, or statutory, as to the accuracy or completeness of such information, which may be subject to change without notice. Komodo shall not be liable for any errors or any actions taken in relation to the above. Statements of opinion and belief are those of the authors and/or editors who contribute to this application, and are based solely upon the information possessed by such authors and/or editors. No inference should be drawn that Komodo or such authors or editors have any special or greater knowledge about the crypto-assets or companies profiled or any particular expertise in the industries or markets in which the profiled crypto-assets and companies operate and compete.Information on this application is obtained from sources deemed to be reliable; however, Komodo takes no responsibility for verifying the accuracy of such information and makes no representation that such information is accurate or complete. Certain statements included in this application may be forward-looking statements based on current expectations. Komodo makes no representation and provides no assurance or guarantee that such forward-looking statements will prove to be accurate.Persons using the Komodo application are urged to consult with a qualified professional with respect to an investment or transaction in any crypto-asset or company profiled herein. Additionally, persons using this application expressly represent that the content in this application is not and will not be a consideration in such persons’ investment or transaction decisions. Traders should verify independently information provided in the Komodo application by completing their own due diligence on any crypto-asset or company in which they are contemplating an investment or transaction of any kind and review a complete information package on that crypto-asset or company, which should include, but not be limited to, related blog updates and press releases.Past performance of profiled crypto-assets and securities is not indicative of future results. Crypto-assets and companies profiled on this site may lack an active trading market and invest in a crypto-asset or security that lacks an active trading market or trade on certain media, platforms and markets are deemed highly speculative and carry a high degree of risk. Anyone holding such crypto-assets and securities should be financially able and prepared to bear the risk of loss and the actual loss of his or her entire trade. The information in this application is not designed to be used as a basis for an investment decision. Persons using the Komodo application should confirm to their own satisfaction the veracity of any information prior to entering into any investment or making any transaction. The decision to buy or sell any crypto-asset or security that may be featured by Komodo is done purely and entirely at the reader’s own risk. As a reader and user of this application, You agree that under no circumstances will You seek to hold liable owners, members, officers, directors, partners, consultants or other persons involved in the publication of this application for any losses incurred by the use of information contained in this applicationKomodo and its contractors and affiliates may profit in the event the crypto-assets and securities increase or decrease in value. Such crypto-assets and securities may be bought or sold from time to time, even after Komodo has distributed positive information regarding the crypto-assets and companies. Komodo has no obligation to inform readers of its trading activities or the trading activities of any of its owners, members, officers, directors, contractors and affiliates and/or any companies affiliated with BC Relations’ owners, members, officers, directors, contractors and affiliates.Komodo and its affiliates may from time to time enter into agreements to purchase crypto-assets or securities to provide a method to reach their goals.'),
        'eulaParagraphe17': MessageLookupByLibrary.simpleMessage(
            'The Terms are effective until terminated by Komodo Platform. \nIn the event of termination, You are no longer authorized to access the Application, but all restrictions imposed on You and the disclaimers and limitations of liability set out in the Terms will survive termination. \nSuch termination shall not affect any legal right that may have accrued to Komodo Platform against You up to the date of termination. \nKomodo Platform may also remove the Application as a whole or any sections or features of the Application at any time. '),
        'eulaParagraphe18': MessageLookupByLibrary.simpleMessage(
            'The provisions of previous paragraphs are for the benefit of Komodo Platform and its officers, directors, employees, agents, licensors, suppliers, and any third party information providers to the Application. Each of these individuals or entities shall have the right to assert and enforce those provisions directly against You on its own behalf.'),
        'eulaParagraphe19': MessageLookupByLibrary.simpleMessage(
            'We might be required to retain and use personal data to meet our internal and external audit requirements, for data security purposes and as we believe to be necessary or appropriate: \n(a) to comply with our obligations under applicable law and regulations, which may include laws and regulations outside your country of residence;\n(b) to respond to requests from courts, law enforcement agencies, regulatory agencies, and other public and government authorities, which may include such authorities outside your country of residence; \n(c) to monitor compliance with and enforce our Platform terms and conditions;\n(d) to carry out anti-money laundering, sanctions or Know Your Customer checks as required by applicable laws and regulations; \n(e) to protect our rights, privacy, safety, property, or those of other persons. We may also be required to use and retain personal data after You have closed your account for legal, regulatory and compliance reasons, such as the prevention, detection or investigation of a crime; loss prevention; or fraud prevention. \nWe also collect and process non-personal, anonymized data for statistical purposes and analysis and to help us provide a better service.\n\nThis document was last updated on July 3, 2019'),
        'eulaParagraphe2': MessageLookupByLibrary.simpleMessage(
            'This disclaimer applies to the contents and services of the app AtomicDEX and is valid for all users of the “Application” (\'Software\', “Mobile Application”, “Application” or “App”).\n\nThe Application is owned by Komodo Platform.\n\nWe reserve the right to amend the following Terms and Conditions (governing the use of the application “atomicDEX mobile”) at any time without prior notice and at our sole discretion. It is your responsibility to periodically check this Terms and Conditions for any updates to these Terms, which shall come into force once published.\nYour continued use of the application shall be deemed as acceptance of the following Terms. \nWe are a company incorporated in Vietnam and these Terms and Conditions are governed by and subject to the laws of Vietnam. \nIf You do not agree with these Terms and Conditions, You must not use or access this software.'),
        'eulaParagraphe3': MessageLookupByLibrary.simpleMessage(
            'By entering into this User (each subject accessing or using the site) Agreement (this writing) You declare that You are an individual over the age of majority (at least 18 or older) and have the capacity to enter into this User Agreement and accept to be legally bound by the terms and conditions of this User Agreement, as incorporated herein and amended from time to time. \nIn order to use the Services provided by Komodo Platform, You may be required to provide certain identification details pursuant to our know-your-customer and anti-money laundering compliance program.'),
        'eulaParagraphe4': MessageLookupByLibrary.simpleMessage(
            'We may change the terms of this User Agreement at any time. Any such changes will take effect when published in the application, or when You use the Services.\n\n\nRead the User Agreement carefully every time You use our Services. Your continued use of the Services shall signify your acceptance to be bound by the current User Agreement. Our failure or delay in enforcing or partially enforcing any provision of this User Agreement shall not be construed as a waiver of any.'),
        'eulaParagraphe5': MessageLookupByLibrary.simpleMessage(
            'You are not allowed to decompile, decode, disassemble, rent, lease, loan, sell, sublicense, or create derivative works from the atomicDEX mobile application or the user content. Nor are You allowed to use any network monitoring or detection software to determine the software architecture, or extract information about usage or individuals’ or users’ identities. \nYou are not allowed to copy, modify, reproduce, republish, distribute, display, or transmit for commercial, non-profit or public purposes all or any portion of the application or the user content without our prior written authorization.'),
        'eulaParagraphe6': MessageLookupByLibrary.simpleMessage(
            'If you create an account in the Mobile Application, you are responsible for maintaining the security of your account and you are fully responsible for all activities that occur under the account and any other actions taken in connection with it. You must immediately notify us of any unauthorized uses of your account or any other breaches of security. We will not be liable for any acts or omissions by you, including any damages of any kind incurred as a result of such acts or omissions.\n'),
        'eulaParagraphe7': MessageLookupByLibrary.simpleMessage(
            'We are not responsible for seed-phrases residing in the Mobile Application. In no event shall we be held liable for any loss of any kind. It is your sole responsibility to maintain appropriate backup of your accounts/seedphrases.'),
        'eulaParagraphe8': MessageLookupByLibrary.simpleMessage(
            'You should not act, or refrain from acting solely on the basis of the content of this application. \nYour access to this application does not itself create an adviser-client relationship between You and us. \nThe content of this application does not constitute a solicitation or inducement to invest in any financial products or services offered by us. \nAny advice included in this application has been prepared without taking into account your objectives, financial situation or needs. You should consider our Risk Disclosure Notice before making any decision on whether to acquire the product described in that document.'),
        'eulaParagraphe9': MessageLookupByLibrary.simpleMessage(
            'We do not guarantee your continuous access to the application or that your access or use will be error-free. \nWe will not be liable in the event that the application is unavailable to You for any reason (for example, due to computer downtime ascribable to malfunctions, upgrades, server problems, precautionary or corrective maintenance activities or interruption in telecommunication supplies). \n\nWe reserve the right at any time to: \n- deny or terminate all or part of your access to the application whereas in our opinion, there are concerns regarding unreasonable use, security issues or unauthorised access or You have breached any of these Terms;\n- block or suspend – in full or partially - your account, remove your default settings, or part thereof, without prior notice to You.'),
        'eulaTitle1': MessageLookupByLibrary.simpleMessage(
            'End-User License Agreement (EULA) of atomicDEX mobile:\n'),
        'eulaTitle10':
            MessageLookupByLibrary.simpleMessage('ACCESS AND SECURITY\n'),
        'eulaTitle11': MessageLookupByLibrary.simpleMessage(
            'INTELLECTUAL PROPERTY RIGHTS\n'),
        'eulaTitle12': MessageLookupByLibrary.simpleMessage('DISCLAIMER'),
        'eulaTitle13': MessageLookupByLibrary.simpleMessage(
            'REPRESENTATIONS AND WARRANTIES, INDEMNIFICATION, AND LIMITATION OF LIABILITY\n'),
        'eulaTitle14':
            MessageLookupByLibrary.simpleMessage('GENERAL RISK FACTORS\n'),
        'eulaTitle15': MessageLookupByLibrary.simpleMessage('INDEMNIFICATION'),
        'eulaTitle16': MessageLookupByLibrary.simpleMessage(
            'RISK DISCLOSURES RELATING TO THE WALLET\n'),
        'eulaTitle17': MessageLookupByLibrary.simpleMessage(
            'NO INVESTMENT ADVICE OR BROKERAGE\n'),
        'eulaTitle18': MessageLookupByLibrary.simpleMessage('TERMINATION'),
        'eulaTitle19':
            MessageLookupByLibrary.simpleMessage('THIRD PARTY RIGHTS\n'),
        'eulaTitle2': MessageLookupByLibrary.simpleMessage(
            'TERMS and CONDITIONS: (APPLICATION USER AGREEMENT)\n'),
        'eulaTitle20':
            MessageLookupByLibrary.simpleMessage('OUR LEGAL OBLIGATIONS\n'),
        'eulaTitle3': MessageLookupByLibrary.simpleMessage(
            'TERMS AND CONDITIONS OF USE AND DISCLAIMER\n'),
        'eulaTitle4': MessageLookupByLibrary.simpleMessage('GENERAL USE\n'),
        'eulaTitle5': MessageLookupByLibrary.simpleMessage('MODIFICATIONS'),
        'eulaTitle6':
            MessageLookupByLibrary.simpleMessage('LIMITATIONS ON USE\n'),
        'eulaTitle7':
            MessageLookupByLibrary.simpleMessage('Accounts and membership\n'),
        'eulaTitle8': MessageLookupByLibrary.simpleMessage('Backups'),
        'eulaTitle9': MessageLookupByLibrary.simpleMessage('GENERAL WARNING\n'),
        'exampleHintSeed':
            MessageLookupByLibrary.simpleMessage('例如： build case level 。。。'),
        'exchangeTitle': MessageLookupByLibrary.simpleMessage('交易中心'),
        'feedback': MessageLookupByLibrary.simpleMessage('發送反饋'),
        'from': MessageLookupByLibrary.simpleMessage('從'),
        'getBackupPhrase':
            MessageLookupByLibrary.simpleMessage('重要提醒: 在繼續之前請記得備份助記詞 !'),
        'goToPorfolio': MessageLookupByLibrary.simpleMessage('前往資產配置'),
        'hintConfirmPassword': MessageLookupByLibrary.simpleMessage('確認密碼'),
        'hintCurrentPassword': MessageLookupByLibrary.simpleMessage('當前密碼'),
        'hintEnterPassword': MessageLookupByLibrary.simpleMessage('請輸入您的密碼'),
        'hintEnterSeedPhrase': MessageLookupByLibrary.simpleMessage('請輸入您的助記詞'),
        'hintNameYourWallet': MessageLookupByLibrary.simpleMessage('錢包名稱'),
        'hintPassword': MessageLookupByLibrary.simpleMessage('密碼'),
        'history': MessageLookupByLibrary.simpleMessage('歷史'),
        'infoPasswordDialog':
            MessageLookupByLibrary.simpleMessage('如果您不使用密碼，每次進入錢包時都需要輸入助記詞。'),
        'infoTrade1': MessageLookupByLibrary.simpleMessage('兌換需求是無法撤銷的！'),
        'infoTrade2':
            MessageLookupByLibrary.simpleMessage('此交易時間可能長達 10 分鐘 - 請勿關閉應用程式！'),
        'infoWalletPassword': MessageLookupByLibrary.simpleMessage(
            '您可以選擇使用密碼加密您的錢包。如果您選擇不使用密碼，則每次進入錢包時都需要輸入助記詞。'),
        'legalTitle': MessageLookupByLibrary.simpleMessage('條款 (目前只提供英文版)'),
        'loading': MessageLookupByLibrary.simpleMessage('載入中。。。'),
        'loadingOrderbook': MessageLookupByLibrary.simpleMessage('委託訂單載入中。。。'),
        'lockScreen': MessageLookupByLibrary.simpleMessage('螢幕已鎖定'),
        'lockScreenAuth': MessageLookupByLibrary.simpleMessage('請登入！'),
        'login': MessageLookupByLibrary.simpleMessage('登入'),
        'logout': MessageLookupByLibrary.simpleMessage('登出'),
        'logoutOnExit': MessageLookupByLibrary.simpleMessage('離開時登出'),
        'logoutsettings': MessageLookupByLibrary.simpleMessage('登出設定'),
        'makeAorder': MessageLookupByLibrary.simpleMessage('建立訂單'),
        'makerpaymentID': MessageLookupByLibrary.simpleMessage('掛單交易 ID'),
        'marketplace': MessageLookupByLibrary.simpleMessage('Marketplace'),
        'max': MessageLookupByLibrary.simpleMessage('上限'),
        'media': MessageLookupByLibrary.simpleMessage('新聞'),
        'mediaBrowse': MessageLookupByLibrary.simpleMessage('瀏覽'),
        'mediaBrowseFeed': MessageLookupByLibrary.simpleMessage('瀏覽新聞'),
        'mediaBy': MessageLookupByLibrary.simpleMessage('--'),
        'mediaNotSavedDescription':
            MessageLookupByLibrary.simpleMessage('您沒有收藏的文章'),
        'mediaSaved': MessageLookupByLibrary.simpleMessage('已收藏'),
        'minValue': m10,
        'minValueBuy': m11,
        'networkFee': MessageLookupByLibrary.simpleMessage('礦工費用'),
        'newAccount': MessageLookupByLibrary.simpleMessage('新帳戶'),
        'newAccountUpper': MessageLookupByLibrary.simpleMessage('新帳戶'),
        'newsFeed': MessageLookupByLibrary.simpleMessage('新聞'),
        'next': MessageLookupByLibrary.simpleMessage('下一步'),
        'noArticles': MessageLookupByLibrary.simpleMessage('無新聞 - 請稍後再試！'),
        'noFunds': MessageLookupByLibrary.simpleMessage('無資產'),
        'noFundsDetected':
            MessageLookupByLibrary.simpleMessage('當前無資產 - 請儲存資產。'),
        'noInternet': MessageLookupByLibrary.simpleMessage('無法連上網路'),
        'noOrder': m3,
        'noOrderAvailable': MessageLookupByLibrary.simpleMessage('點擊建立訂單'),
        'noRewardYet':
            MessageLookupByLibrary.simpleMessage('沒有獎勵可領取 - 請一個小時後重試。'),
        'noSwaps': MessageLookupByLibrary.simpleMessage('沒有紀錄'),
        'noTxs': MessageLookupByLibrary.simpleMessage('無交易'),
        'notEnoughEth': MessageLookupByLibrary.simpleMessage('沒有足夠的交易ETH！'),
        'notEnoughtBalanceForFee':
            MessageLookupByLibrary.simpleMessage('餘額不足以支付手續費 - 請調整交易數量。'),
        'numberAssets': m4,
        'orderCreated': MessageLookupByLibrary.simpleMessage('委託訂單提交'),
        'orderCreatedInfo': MessageLookupByLibrary.simpleMessage('委託訂單成功建立'),
        'orderMatched': MessageLookupByLibrary.simpleMessage('訂單匹配成功'),
        'orderMatching': MessageLookupByLibrary.simpleMessage('訂單匹配中'),
        'orders': MessageLookupByLibrary.simpleMessage('當前委託'),
        'paidWith': MessageLookupByLibrary.simpleMessage('付款方式'),
        'placeOrder': MessageLookupByLibrary.simpleMessage('下單'),
        'portfolio': MessageLookupByLibrary.simpleMessage('資產配置'),
        'price': MessageLookupByLibrary.simpleMessage('價錢'),
        'receive': MessageLookupByLibrary.simpleMessage('轉入'),
        'receiveLower': MessageLookupByLibrary.simpleMessage('收'),
        'recommendSeedMessage':
            MessageLookupByLibrary.simpleMessage('我們強烈建議離線保管。'),
        'requestedTrade': MessageLookupByLibrary.simpleMessage('交易需求'),
        'restoreWallet': MessageLookupByLibrary.simpleMessage('恢復錢包'),
        'security': MessageLookupByLibrary.simpleMessage('安全'),
        'seeOrders': m5,
        'seedPhraseTitle': MessageLookupByLibrary.simpleMessage('您的新助記詞'),
        'selectCoin': MessageLookupByLibrary.simpleMessage('請選代幣'),
        'selectCoinInfo': MessageLookupByLibrary.simpleMessage('請選您想要添加的代幣。'),
        'selectCoinTitle': MessageLookupByLibrary.simpleMessage('新增代幣:'),
        'selectCoinToBuy': MessageLookupByLibrary.simpleMessage('請選擇您要買的代幣'),
        'selectCoinToSell': MessageLookupByLibrary.simpleMessage('請選擇您要賣的代幣'),
        'selectPaymentMethod': MessageLookupByLibrary.simpleMessage('請選擇付款方式'),
        'sell': MessageLookupByLibrary.simpleMessage('賣'),
        'send': MessageLookupByLibrary.simpleMessage('轉出'),
        'setUpPassword': MessageLookupByLibrary.simpleMessage('設定密碼'),
        'settingDialogSpan1': MessageLookupByLibrary.simpleMessage('確定要刪除'),
        'settingDialogSpan2': MessageLookupByLibrary.simpleMessage(' 錢包嗎？'),
        'settingDialogSpan3': MessageLookupByLibrary.simpleMessage('如果是，確保您 '),
        'settingDialogSpan4': MessageLookupByLibrary.simpleMessage(' 紀錄助記詞。'),
        'settingDialogSpan5':
            MessageLookupByLibrary.simpleMessage(' 以便將來恢復錢包。'),
        'settings': MessageLookupByLibrary.simpleMessage('設定'),
        'shareAddress': m6,
        'showMyOrders': MessageLookupByLibrary.simpleMessage('顯示我的委託單'),
        'signInWithPassword': MessageLookupByLibrary.simpleMessage('匯入密碼'),
        'signInWithSeedPhrase': MessageLookupByLibrary.simpleMessage('匯入助記詞'),
        'step': MessageLookupByLibrary.simpleMessage('步驟'),
        'success': MessageLookupByLibrary.simpleMessage('成功!'),
        'swap': MessageLookupByLibrary.simpleMessage('兌換'),
        'swapDetailTitle': MessageLookupByLibrary.simpleMessage('請確認交易明細'),
        'swapFailed': MessageLookupByLibrary.simpleMessage('兌換失敗'),
        'swapID': MessageLookupByLibrary.simpleMessage('兌換 ID'),
        'swapOngoing': MessageLookupByLibrary.simpleMessage('兌換中'),
        'swapSucceful': MessageLookupByLibrary.simpleMessage('兌換成功'),
        'takerpaymentsID': MessageLookupByLibrary.simpleMessage('吃單交易 ID'),
        'timeOut': MessageLookupByLibrary.simpleMessage('超時'),
        'titleCreatePassword': MessageLookupByLibrary.simpleMessage('創建一個密碼'),
        'to': MessageLookupByLibrary.simpleMessage('至'),
        'toAddress': MessageLookupByLibrary.simpleMessage('收款地址:'),
        'trade': MessageLookupByLibrary.simpleMessage('交易'),
        'tradeCompleted': MessageLookupByLibrary.simpleMessage('兌換成功！'),
        'tradeDetail': MessageLookupByLibrary.simpleMessage('交易明細'),
        'txBlock': MessageLookupByLibrary.simpleMessage('區塊'),
        'txConfirmations': MessageLookupByLibrary.simpleMessage('交易確認'),
        'txConfirmed': MessageLookupByLibrary.simpleMessage('已確認'),
        'txFee': MessageLookupByLibrary.simpleMessage('手續費'),
        'txHash': MessageLookupByLibrary.simpleMessage('交易 ID'),
        'txNotConfirmed': MessageLookupByLibrary.simpleMessage('未確認'),
        'unlock': MessageLookupByLibrary.simpleMessage('解鎖您的錢包'),
        'value': MessageLookupByLibrary.simpleMessage('金額: '),
        'version': MessageLookupByLibrary.simpleMessage('版本'),
        'viewSeed': MessageLookupByLibrary.simpleMessage('導出助記詞'),
        'volumes': MessageLookupByLibrary.simpleMessage('Volumes'),
        'welcomeInfo': MessageLookupByLibrary.simpleMessage(
            'ATOMIC DEX 是次世代多幣別錢包, 具有原生第三代的DEX功能等等。'),
        'welcomeLetSetUp': MessageLookupByLibrary.simpleMessage('創建錢包'),
        'welcomeName': MessageLookupByLibrary.simpleMessage('AtomicDEX'),
        'welcomeTitle': MessageLookupByLibrary.simpleMessage('歡迎使用'),
        'welcomeWallet': MessageLookupByLibrary.simpleMessage('錢包'),
        'withdraw': MessageLookupByLibrary.simpleMessage('提領'),
        'withdrawConfirm': MessageLookupByLibrary.simpleMessage('確認提領'),
        'withdrawValue': m7,
        'wrongPassword': MessageLookupByLibrary.simpleMessage('密碼不正確。請再重試一次。'),
        'youAreSending': MessageLookupByLibrary.simpleMessage('您正在發送：'),
        'youWillReceiveClaim': m8,
        'youWillReceived': MessageLookupByLibrary.simpleMessage('可獲得： ')
      };
}