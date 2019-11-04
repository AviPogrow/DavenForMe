//
//  NameDetailViewController.swift
//  autolayout_lbta
//
//  Created by user on 5/9/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit


 let aviDisplayString =
"אברהם-פנחס-בן-מרים"



let aviHebrewLettersArray =
["א", "ב", "ר", "ה", "ם", "-", "פ", "נ", "ח", "ס", "-", "ב", "ן", "-", "מ", "ר", "י", "ם"]

let aviKapitelKeysArray = ["AlephLetterKapitel", "BeisLetterKapitel", "RayshLetterKapitel", "HeyLetterKapitel", "MemSofitLetterKapitel", "SpaceLetterKapitel", "PeyLetterKapitel", "NunLetterKapitel", "ChesLetterKapitel", "SamechLetterKapitel", "SpaceLetterKapitel", "BeisLetterKapitel", "NunSofitLetterKapitel", "SpaceLetterKapitel", "MemLetterKapitel", "RayshLetterKapitel", "YudLetterKapitel", "MemSofitLetterKapitel"]

let aviKapitelStringsArray =
["אַשְׁרֵי תְמִימֵי דָרֶךְ הַהֹלְכִים בְּתוֹרַת יְהֹוָה: אַשְׁרֵי נֹצְרֵי עֵדֹתָיו בְּכָל לֵב יִדְרְשׁוּהוּ: אַף לֹא פָעֲלוּ עַוְלָה בִּדְרָכָיו הָלָכוּ: אַתָּה צִוִּיתָה פִקֻּדֶיךָ לִשְׁמֹר מְאֹד: אַחֲלַי יִכֹּנוּ דְּרָכָי לִשְׁמֹר חֻקֶּיךָ: אָז לֹא אֵבוֹשׁ בְּהַבִּיטִי אֶל כָּל מִצְו‍ֹתֶיךָ: אוֹדְךָ בְּיֹשֶׁר לֵבָב בְּלָמְדִי מִשְׁפְּטֵי צִדְקֶךָ: אֶת חֻקֶּיךָ אֶשְׁמֹר אַל תַּעַזְבֵנִי עַד מְאֹד:", "בַּמֶּה יְזַכֶּה נַּעַר אֶת אָרְחוֹ לִשְׁמֹר כִּדְבָרֶךָ: בְּכָל לִבִּי דְרַשְׁתִּיךָ אַל תַּשְׁגֵּנִי מִמִּצְו‍ֹתֶיךָ: בְּלִבִּי צָפַנְתִּי אִמְרָתֶךָ לְמַעַן לֹא אֶחֱטָא לָךְ: בָּרוּךְ אַתָּה יְהֹוָה לַמְּדֵנִי חֻקֶּיךָ: בִּשְׂפָתַי סִפַּרְתִּי כֹּל מִשְׁפְּטֵי פִיךָ: בְּדֶרֶךְ עֵדְו‍ֹתֶיךָ שַׂשְׂתִּי כְּעַל כָּל הוֹן: בְּפִקּוּדֶיךָ אָשִׂיחָה וְאַבִּיטָה אֹרְחֹתֶיךָ: בְּחֻקֹּתֶיךָ אֶשְׁתַּעֲשָׁע לֹא אֶשְׁכַּח דְּבָרֶךָ:", "רְאֵה עָנְיִי וְחַלְּצֵנִי כִּי תוֹרָתְךָ לֹא שָׁכָחְתִּי: רִיבָה רִיבִי וּגְאָלֵנִי לְאִמְרָתְךָ חַיֵּנִי: רָחוֹק מֵרְשָׁעִים יְשׁוּעָה כִּי חֻקֶּיךָ לֹא דָרָשׁוּ: רַחֲמֶיךָ רַבִּים | יְהֹוָה כְּמִשְׁפָּטֶיךָ חַיֵּנִי: רַבִּים רֹדְפַי וְצָרָי מֵעֵדְו‍ֹתֶיךָ לֹא נָטִיתִי: רָאִיתִי בֹגְדִים וָאֶתְקוֹטָטָה אֲשֶׁר אִמְרָתְךָ לֹא שָׁמָרוּ: רְאֵה כִּי פִקּוּדֶיךָ אָהָבְתִּי יְהֹוָה כְּחַסְדְּךָ חַיֵּנִי: רֹאשׁ דְּבָרְךָ אֱמֶת וּלְעוֹלָם כָּל מִשְׁפַּט צִדְקֶךָ:", "הוֹרֵנִי יְהֹוָה דֶּרֶךְ חֻקֶּיךָ וְאֶצְּרֶנָּה עֵקֶב: הֲבִינֵנִי וְאֶצְּרָה תוֹרָתֶךָ וְאֶשְׁמְרֶנָּה בְכָל לֵב: הַדְרִיכֵנִי בִּנְתִיב מִצְו‍ֹתֶיךָ כִּי בוֹ חָפָצְתִּי: הַט לִבִּי אֶל עֵדְו‍ֹתֶיךָ וְאַל אֶל בָּצַע: הַעֲבֵר עֵינַי מֵרְאוֹת שָׁוְא בִּדְרָכֶךָ חַיֵּנִי: הָקֵם לְעַבְדְּךָ אִמְרָתֶךָ אֲשֶׁר לְיִרְאָתֶךָ: הַעֲבֵר חֶרְפָּתִי אֲשֶׁר יָגֹרְתִּי כִּי מִשְׁפָּטֶיךָ טוֹבִים: הִנֵּה תָּאַבְתִּי לְפִקֻּדֶיךָ בְּצִדְקָתְךָ חַיֵּנִי:", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:", "Space", " פְּלָאוֹת עֵדְו‍ֹתֶיךָ עַל כֵּן נְצָרָתַם נַפְשִׁי: פֵּתַח דְּבָרֶיךָ יָאִיר מֵבִין פְּתָיִים: פִּי פָעַרְתִּי וָאֶשְׁאָפָה כִּי לְמִצְו‍ֹתֶיךָ יָאָבְתִּי: פְּנֵה אֵלַי וְחָנֵּנִי כְּמִשְׁפָּט לְאֹהֲבֵי שְׁמֶךָ: פְּעָמַי הָכֵן בְּאִמְרָתֶךָ וְאַל תַּשְׁלֶט בִּי כָל אָוֶן: פְּדֵנִי מֵעֹשֶׁק אָדָם וְאֶשְׁמְרָה פִּקּוּדֶיךָ: פָּנֶיךָ הָאֵר בְּעַבְדֶּךָ וְלַמְּדֵנִי אֶת חֻקֶּיךָ: פַּלְגֵי מַיִם יָרְדוּ עֵינָי עַל לֹא שָׁמְרוּ תוֹרָתֶךָ:", "נֵר לְרַגְלִי דְבָרֶךָ וְאוֹר לִנְתִיבָתִי: נִשְׁבַּעְתִּי וָאֲקַיֵּמָה לִשְׁמֹר מִשְׁפְּטֵי צִדְקֶךָ: נַעֲנֵיתִי עַד מְאֹד יְהֹוָה חַיֵּנִי כִדְבָרֶךָ: נִדְבוֹת פִּי רְצֵה נָא יְהֹוָה וּמִשְׁפָּטֶיךָ לַמְּדֵנִי: נַפְשִׁי בְכַפִּי תָמִיד וְתוֹרָתְךָ לֹא שָׁכָחְתִּי: נָתְנוּ רְשָׁעִים פַּח לִי וּמִפִּקּוּדֶיךָ לֹא תָעִיתִי: נָחַלְתִּי עֵדְו‍ֹתֶיךָ לְעוֹלָם כִּי שְׂשׂוֹן לִבִּי הֵמָּה: נָטִיתִי לִבִּי לַעֲשׂוֹת חֻקֶּיךָ לְעוֹלָם עֵקֶב:", "חֶלְקִי יְהֹוָה אָמַרְתִּי לִשְׁמֹר דְּבָרֶיךָ: חִלִּיתִי פָנֶיךָ בְכָל לֵב חָנֵּנִי כְּאִמְרָתֶךָ: חִשַּׁבְתִּי דְרָכָי וָאָשִׁיבָה רַגְלַי אֶל עֵדֹתֶיךָ: חַשְׁתִּי וְלֹא הִתְמַהְמָהְתִּי לִשְׁמֹר מִצְו‍ֹתֶיךָ: חֶבְלֵי רְשָׁעִים עִוְּדֻנִי תּוֹרָתְךָ לֹא שָׁכָחְתִּי: חֲצוֹת לַיְלָה אָקוּם לְהוֹדוֹת לָךְ עַל מִשְׁפְּטֵי צִדְקֶךָ: חָבֵר אָנִי לְכָל אֲשֶׁר יְרֵאוּךָ וּלְשֹׁמְרֵי פִּקּוּדֶיךָ: חַסְדְּךָ יְהֹוָה מָלְאָה הָאָרֶץ חֻקֶּיךָ לַמְּדֵנִי:", "סֵעֲפִים שָׂנֵאתִי וְתוֹרָתְךָ אָהָבְתִּי: סִתְרִי וּמָגִנִּי אָתָּה לִדְבָרְךָ יִחָלְתִּי: סוּרוּ מִמֶּנִּי מְרֵעִים וְאֶצְּרָה מִצְו‍ֹת אֱלֹהָי: סָמְכֵנִי כְאִמְרָתְךָ וְאֶחְיֶה וְאַל תְּבִישֵׁנִי מִשִּׂבְרִי: סְעָדֵנִי וְאִוָּשֵׁעָה וְאֶשְׁעָה בְחֻקֶּיךָ תָמִיד: סָלִיתָ כָּל שֹׁגִים מֵחֻקֶּיךָ כִּי שֶׁקֶר תַּרְמִיתָם: סִגִים הִשְׁבַּתָּ כָל רִשְׁעֵי אָרֶץ לָכֵן אָהַבְתִּי עֵדֹתֶיךָ: סָמַר מִפַּחְדְּךָ בְשָׂרִי וּמִמִּשְׁפָּטֶיךָ יָרֵאתִי:", "Space", "בַּמֶּה יְזַכֶּה נַּעַר אֶת אָרְחוֹ לִשְׁמֹר כִּדְבָרֶךָ: בְּכָל לִבִּי דְרַשְׁתִּיךָ אַל תַּשְׁגֵּנִי מִמִּצְו‍ֹתֶיךָ: בְּלִבִּי צָפַנְתִּי אִמְרָתֶךָ לְמַעַן לֹא אֶחֱטָא לָךְ: בָּרוּךְ אַתָּה יְהֹוָה לַמְּדֵנִי חֻקֶּיךָ: בִּשְׂפָתַי סִפַּרְתִּי כֹּל מִשְׁפְּטֵי פִיךָ: בְּדֶרֶךְ עֵדְו‍ֹתֶיךָ שַׂשְׂתִּי כְּעַל כָּל הוֹן: בְּפִקּוּדֶיךָ אָשִׂיחָה וְאַבִּיטָה אֹרְחֹתֶיךָ: בְּחֻקֹּתֶיךָ אֶשְׁתַּעֲשָׁע לֹא אֶשְׁכַּח דְּבָרֶךָ:", "נֵר לְרַגְלִי דְבָרֶךָ וְאוֹר לִנְתִיבָתִי: נִשְׁבַּעְתִּי וָאֲקַיֵּמָה לִשְׁמֹר מִשְׁפְּטֵי צִדְקֶךָ: נַעֲנֵיתִי עַד מְאֹד יְהֹוָה חַיֵּנִי כִדְבָרֶךָ: נִדְבוֹת פִּי רְצֵה נָא יְהֹוָה וּמִשְׁפָּטֶיךָ לַמְּדֵנִי: נַפְשִׁי בְכַפִּי תָמִיד וְתוֹרָתְךָ לֹא שָׁכָחְתִּי: נָתְנוּ רְשָׁעִים פַּח לִי וּמִפִּקּוּדֶיךָ לֹא תָעִיתִי: נָחַלְתִּי עֵדְו‍ֹתֶיךָ לְעוֹלָם כִּי שְׂשׂוֹן לִבִּי הֵמָּה: נָטִיתִי לִבִּי לַעֲשׂוֹת חֻקֶּיךָ לְעוֹלָם עֵקֶב:", "Space", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:", "רְאֵה עָנְיִי וְחַלְּצֵנִי כִּי תוֹרָתְךָ לֹא שָׁכָחְתִּי: רִיבָה רִיבִי וּגְאָלֵנִי לְאִמְרָתְךָ חַיֵּנִי: רָחוֹק מֵרְשָׁעִים יְשׁוּעָה כִּי חֻקֶּיךָ לֹא דָרָשׁוּ: רַחֲמֶיךָ רַבִּים | יְהֹוָה כְּמִשְׁפָּטֶיךָ חַיֵּנִי: רַבִּים רֹדְפַי וְצָרָי מֵעֵדְו‍ֹתֶיךָ לֹא נָטִיתִי: רָאִיתִי בֹגְדִים וָאֶתְקוֹטָטָה אֲשֶׁר אִמְרָתְךָ לֹא שָׁמָרוּ: רְאֵה כִּי פִקּוּדֶיךָ אָהָבְתִּי יְהֹוָה כְּחַסְדְּךָ חַיֵּנִי: רֹאשׁ דְּבָרְךָ אֱמֶת וּלְעוֹלָם כָּל מִשְׁפַּט צִדְקֶךָ:", "יָדֶיךָ עָשׂוּנִי וַיְכוֹנְנוּנִי הֲבִינֵנִי וְאֶלְמְדָה מִצְו‍ֹתֶיךָ: יְרֵאֶיךָ יִרְאוּנִי וְיִשְׂמָחוּ כִּי לִדְבָרְךָ יִחָלְתִּי: יָדַעְתִּי יְהֹוָה כִּי צֶדֶק מִשְׁפָּטֶיךָ וֶאֱמוּנָה עִנִּיתָנִי: יְהִי נָא חַסְדְּךָ לְנַחֲמֵנִי כְּאִמְרָתְךָ לְעַבְדֶּךָ: יְבֹאוּנִי רַחֲמֶיךָ וְאֶחְיֶה כִּי תוֹרָתְךָ שַׁעֲשֻׁעָי: יֵבֹשׁוּ זֵדִים כִּי שֶׁקֶר עִוְּתוּנִי אֲנִי אָשִׂיחַ בְּפִקּוּדֶיךָ: יָשׁוּבוּ לִי יְרֵאֶיךָ וְיֹדְעֵי (כתיב וְיֹדְעֵו) עֵדֹתֶיךָ: יְהִי לִבִּי תָמִים בְּחֻקֶּיךָ לְמַעַן לֹא אֵבוֹשׁ:", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:"]



let sarahChanaDisplayString =  "שרה חנה בילא בת מרים יוכבד"
let sarahChanaArrayOfLetters =
["ש","ר","ה","-", "ח","נ","ה","-","ב","י","ל","א","-"," ב","ת","-", "מ","ר","י","ם","-", "י","ו","כ","ב","ד"]


class NameDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    
    @IBOutlet weak var tehillimTextCollectionView: UICollectionView!
    
   
    let cellId = "cellId"
    let pageCellID = "pageCellID"
    var dataModel: DataModel!
    

    var currentPageNumber: Int = 0
    var topIndexReversed: [Int] = []
    var myIndexArray: [Int] = []
   
    
    var selectedPerson: Person!
    var currentMispaleli: Mispaleli!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        currentMispaleli =
                   
                   Mispaleli(displayStringForName: aviDisplayString, hebrewLettersArray: sarahChanaArrayOfLetters, kapitelStringsArray: aviKapitelStringsArray)
        
        
        _ = currentMispaleli.kapitelStringsArray.reversed()
        
        //print(currentMispaleli.description)
        
         configureNavController()
        configureTopCollectionView()
        configureBottomCollectionView()
       
     }
    
    func configureNavController() {
        navigationController?.hidesBarsOnSwipe = false
        //navigationItem.title = currentMispaleli.displayStringForName
        let _ = UIFont(name: "SBLHebrew", size: 34)
        //navigationController?.navigationBar.titleTextAttributes = customFont
        //navigationItem.title = currentMispaleli.displayStringForName
        navigationItem.title = aviDisplayString
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func configureTopCollectionView() {
        
        let layout = menuBarCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        menuBarCollectionView.semanticContentAttribute = .forceRightToLeft
        menuBarCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId )
        
        menuBarCollectionView.dataSource = self
        menuBarCollectionView.delegate = self
        menuBarCollectionView.tag = 101
        menuBarCollectionView.contentInset = UIEdgeInsets(top: 4, left: 16, bottom: 0, right:                                              16)
                                              
        //menuBarCollectionView.backgroundColor = UIColor(patternImage: UIImage(named: "LandscapeBackground")!)
        menuBarCollectionView.isScrollEnabled = false 
        menuBarCollectionView.bounces = false
        menuBarCollectionView.isPagingEnabled = false
        
    }
    
    func configureBottomCollectionView() {
        
        let bottomLayout = tehillimTextCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        bottomLayout.scrollDirection = .horizontal
         tehillimTextCollectionView.semanticContentAttribute = .forceRightToLeft
        
        //tehillimTextCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tehillimTextCollectionView.register(PageCell.self, forCellWithReuseIdentifier: pageCellID)
        
        
        tehillimTextCollectionView.dataSource = self
        tehillimTextCollectionView.delegate = self
        tehillimTextCollectionView.tag = 102
        tehillimTextCollectionView.isPagingEnabled = true
     
    }
   
    override func viewWillAppear(_ animated: Bool) {
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //tehillimTextCollectionView.reloadData()
        //menuBarCollectionView.reloadData()
        
       // let index = currentMispaleli.kapitelStringsArray.count - 1
        //_ = IndexPath(item: index, section: 0)
        
     
        //tehillimTextCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)

    }
    
       
    
  
    
 
   lazy   var leftRightPadding = view.frame.width * 0//0.10
    lazy   var interSpacing = view.frame.width * 0//0.1
    
   lazy   var totalEmptySpace = (view.frame.width - (2 * leftRightPadding) - (3 * interSpacing))
    
   lazy var totalEmptySpaceforLetters =  (menuBarCollectionView.frame.width - (2 * leftRightPadding) - (3 * interSpacing))
    
   lazy   var letterCellWidth = totalEmptySpace / CGFloat(currentMispaleli.hebrewLettersArray.count)
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 101 {
          // if  currentMispaleli.hebrewLettersArray.count < 17 {
            
             //1/8 the width and 1/3 the height
        
            return .init(width: collectionView.frame.size.width / 8, height: menuBarCollectionView.bounds.height)
            
       }
        else {
        
        //let bottomCellWidth = view.frame.size.width - 40
            let bottomCellHeight = view.frame.size.height - 200
        //let itemSize = CGSize(width:bottomCellWidth, height: bottomCellHeight)
            
            
        
            return .init(width: tehillimTextCollectionView.bounds.width, height: tehillimTextCollectionView.bounds.height)
    }
     }
    
    // the spacing between each row of the keypad
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 101 {
            return 6.0
        } else {
        return 0.0
        }
            
    }
    
    // spacing between column of each section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 101 {
            return          10.0//interSpacing
        } else {
            return interSpacing
        }
    }
    
    // if we are in the second section with the back button and phone button
    // inset the cell from the left margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 0, left: leftRightPadding, bottom: 0, right: leftRightPadding)
    }
}


extension NameDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 101 {
        //return currentMispaleli.hebrewLettersArray.count
            return aviHebrewLettersArray.count
        } else {
           // print("the state of lower dataSource is \(currentMispaleli.kapitelStringsArray.description)")
            return aviKapitelStringsArray.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     if collectionView.tag == 101 {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
    
        //let lettr  =  currentMispaleli.hebrewLettersArray[indexPath.item]
        
        let lettr = aviHebrewLettersArray[indexPath.item]
        
        let customFont = UIFont(name: "SBLHebrew", size: 44)
        menuCell.lettrLabel.font = customFont
        menuCell.lettrLabel.text = lettr
        return menuCell
        
        } else {
            
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellID, for: indexPath) as! PageCell
    
       
        
        
        var kapitelArray = [String]()
        kapitelArray = aviKapitelStringsArray.reversed() //currentMispaleli.kapitelStringsArray.reversed()
        
        var kapitel = kapitelArray[indexPath.row]
        
        pageCell.page = kapitel
      
        return pageCell
    }
    
    }
    // courtesy of
    // http://stackoverflow.com/a/28896715/359578
    
    func visibleRangeOfTextView(_ textView: UITextView) -> NSRange {
        let bounds = textView.bounds
        let origin = CGPoint(x: 100,y: 100) //Overcome the default UITextView left/top margin
        let startCharacterRange = textView.characterRange(at: origin)
        if startCharacterRange == nil {
            return NSMakeRange(0,0)
        }
        let startPosition = textView.characterRange(at: origin)!.start
        
        let endCharacterRange = textView.characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))
        if endCharacterRange == nil {
            return NSMakeRange(0,0)
        }
        let endPosition = textView.characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))!.end
        
        let startIndex = textView.offset(from: textView.beginningOfDocument, to: startPosition)
        let endIndex = textView.offset(from: startPosition, to: endPosition)
        return NSMakeRange(startIndex, endIndex)
    }
    
}

extension NameDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
            if scrollView.tag == 102 {
            
            var bottomPageNum = Int(scrollView.contentOffset.x / view.frame.width)
                
               print("the current page is \(bottomPageNum)")
            
            //var normalIndex = topIndexReversed[bottomPageNum]
            
            let indexPath = IndexPath(item: bottomPageNum, section: 0)
           
            //menuBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            
        }
    }
     func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //print("the scrollview data is \(targetContentOffset.pointee.x)")
        let currentPoint = CGPoint(x: targetContentOffset.pointee.x, y: 50)
        let currentIndexPathFromPoint = tehillimTextCollectionView.indexPathForItem(at: currentPoint)
        //let currentIndexPath = tehillimTextCollectionView.indexPath(for: //<#T##UICollectionViewCell#>)
        menuBarCollectionView.selectItem(at: currentIndexPathFromPoint, animated: true, scrollPosition: .top)
        print("the currentINdexPath is \(currentIndexPathFromPoint)")
    }
    
    }
    
    
    
    
    
    
    





extension NameDetailViewController: UIViewControllerTransitioningDelegate {
    /*
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BounceAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //switch dismissStyle {
        //case .slide:
       //     return SlideOutAnimationController()
       // case .fade:
            return FadeOutAnimationController()
       // }
    }
 */
}
