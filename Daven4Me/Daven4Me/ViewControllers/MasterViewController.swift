//
//  ViewController.swift
//  Daven4Me
//
//  Created by user on 6/14/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    

     let aviDisplayString =
    "אברהם-פנחס-בן-מרים"
    
    let aviHebrewLettersArray =
    ["א", "ב", "ר", "ה", "ם", "-", "פ", "נ", "ח", "ס", "-", "ב", "ן", "-", "מ", "ר", "י", "ם"]

    let aviKapitelKeysArray = ["AlephLetterKapitel", "BeisLetterKapitel", "RayshLetterKapitel", "HeyLetterKapitel", "MemSofitLetterKapitel", "SpaceLetterKapitel", "PeyLetterKapitel", "NunLetterKapitel", "ChesLetterKapitel", "SamechLetterKapitel", "SpaceLetterKapitel", "BeisLetterKapitel", "NunSofitLetterKapitel", "SpaceLetterKapitel", "MemLetterKapitel", "RayshLetterKapitel", "YudLetterKapitel", "MemSofitLetterKapitel"]
    
    let aviKapitelStringsArray =
    ["אַשְׁרֵי תְמִימֵי דָרֶךְ הַהֹלְכִים בְּתוֹרַת יְהֹוָה: אַשְׁרֵי נֹצְרֵי עֵדֹתָיו בְּכָל לֵב יִדְרְשׁוּהוּ: אַף לֹא פָעֲלוּ עַוְלָה בִּדְרָכָיו הָלָכוּ: אַתָּה צִוִּיתָה פִקֻּדֶיךָ לִשְׁמֹר מְאֹד: אַחֲלַי יִכֹּנוּ דְּרָכָי לִשְׁמֹר חֻקֶּיךָ: אָז לֹא אֵבוֹשׁ בְּהַבִּיטִי אֶל כָּל מִצְו‍ֹתֶיךָ: אוֹדְךָ בְּיֹשֶׁר לֵבָב בְּלָמְדִי מִשְׁפְּטֵי צִדְקֶךָ: אֶת חֻקֶּיךָ אֶשְׁמֹר אַל תַּעַזְבֵנִי עַד מְאֹד:", "בַּמֶּה יְזַכֶּה נַּעַר אֶת אָרְחוֹ לִשְׁמֹר כִּדְבָרֶךָ: בְּכָל לִבִּי דְרַשְׁתִּיךָ אַל תַּשְׁגֵּנִי מִמִּצְו‍ֹתֶיךָ: בְּלִבִּי צָפַנְתִּי אִמְרָתֶךָ לְמַעַן לֹא אֶחֱטָא לָךְ: בָּרוּךְ אַתָּה יְהֹוָה לַמְּדֵנִי חֻקֶּיךָ: בִּשְׂפָתַי סִפַּרְתִּי כֹּל מִשְׁפְּטֵי פִיךָ: בְּדֶרֶךְ עֵדְו‍ֹתֶיךָ שַׂשְׂתִּי כְּעַל כָּל הוֹן: בְּפִקּוּדֶיךָ אָשִׂיחָה וְאַבִּיטָה אֹרְחֹתֶיךָ: בְּחֻקֹּתֶיךָ אֶשְׁתַּעֲשָׁע לֹא אֶשְׁכַּח דְּבָרֶךָ:", "רְאֵה עָנְיִי וְחַלְּצֵנִי כִּי תוֹרָתְךָ לֹא שָׁכָחְתִּי: רִיבָה רִיבִי וּגְאָלֵנִי לְאִמְרָתְךָ חַיֵּנִי: רָחוֹק מֵרְשָׁעִים יְשׁוּעָה כִּי חֻקֶּיךָ לֹא דָרָשׁוּ: רַחֲמֶיךָ רַבִּים | יְהֹוָה כְּמִשְׁפָּטֶיךָ חַיֵּנִי: רַבִּים רֹדְפַי וְצָרָי מֵעֵדְו‍ֹתֶיךָ לֹא נָטִיתִי: רָאִיתִי בֹגְדִים וָאֶתְקוֹטָטָה אֲשֶׁר אִמְרָתְךָ לֹא שָׁמָרוּ: רְאֵה כִּי פִקּוּדֶיךָ אָהָבְתִּי יְהֹוָה כְּחַסְדְּךָ חַיֵּנִי: רֹאשׁ דְּבָרְךָ אֱמֶת וּלְעוֹלָם כָּל מִשְׁפַּט צִדְקֶךָ:", "הוֹרֵנִי יְהֹוָה דֶּרֶךְ חֻקֶּיךָ וְאֶצְּרֶנָּה עֵקֶב: הֲבִינֵנִי וְאֶצְּרָה תוֹרָתֶךָ וְאֶשְׁמְרֶנָּה בְכָל לֵב: הַדְרִיכֵנִי בִּנְתִיב מִצְו‍ֹתֶיךָ כִּי בוֹ חָפָצְתִּי: הַט לִבִּי אֶל עֵדְו‍ֹתֶיךָ וְאַל אֶל בָּצַע: הַעֲבֵר עֵינַי מֵרְאוֹת שָׁוְא בִּדְרָכֶךָ חַיֵּנִי: הָקֵם לְעַבְדְּךָ אִמְרָתֶךָ אֲשֶׁר לְיִרְאָתֶךָ: הַעֲבֵר חֶרְפָּתִי אֲשֶׁר יָגֹרְתִּי כִּי מִשְׁפָּטֶיךָ טוֹבִים: הִנֵּה תָּאַבְתִּי לְפִקֻּדֶיךָ בְּצִדְקָתְךָ חַיֵּנִי:", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:", "Space", " פְּלָאוֹת עֵדְו‍ֹתֶיךָ עַל כֵּן נְצָרָתַם נַפְשִׁי: פֵּתַח דְּבָרֶיךָ יָאִיר מֵבִין פְּתָיִים: פִּי פָעַרְתִּי וָאֶשְׁאָפָה כִּי לְמִצְו‍ֹתֶיךָ יָאָבְתִּי: פְּנֵה אֵלַי וְחָנֵּנִי כְּמִשְׁפָּט לְאֹהֲבֵי שְׁמֶךָ: פְּעָמַי הָכֵן בְּאִמְרָתֶךָ וְאַל תַּשְׁלֶט בִּי כָל אָוֶן: פְּדֵנִי מֵעֹשֶׁק אָדָם וְאֶשְׁמְרָה פִּקּוּדֶיךָ: פָּנֶיךָ הָאֵר בְּעַבְדֶּךָ וְלַמְּדֵנִי אֶת חֻקֶּיךָ: פַּלְגֵי מַיִם יָרְדוּ עֵינָי עַל לֹא שָׁמְרוּ תוֹרָתֶךָ:", "נֵר לְרַגְלִי דְבָרֶךָ וְאוֹר לִנְתִיבָתִי: נִשְׁבַּעְתִּי וָאֲקַיֵּמָה לִשְׁמֹר מִשְׁפְּטֵי צִדְקֶךָ: נַעֲנֵיתִי עַד מְאֹד יְהֹוָה חַיֵּנִי כִדְבָרֶךָ: נִדְבוֹת פִּי רְצֵה נָא יְהֹוָה וּמִשְׁפָּטֶיךָ לַמְּדֵנִי: נַפְשִׁי בְכַפִּי תָמִיד וְתוֹרָתְךָ לֹא שָׁכָחְתִּי: נָתְנוּ רְשָׁעִים פַּח לִי וּמִפִּקּוּדֶיךָ לֹא תָעִיתִי: נָחַלְתִּי עֵדְו‍ֹתֶיךָ לְעוֹלָם כִּי שְׂשׂוֹן לִבִּי הֵמָּה: נָטִיתִי לִבִּי לַעֲשׂוֹת חֻקֶּיךָ לְעוֹלָם עֵקֶב:", "חֶלְקִי יְהֹוָה אָמַרְתִּי לִשְׁמֹר דְּבָרֶיךָ: חִלִּיתִי פָנֶיךָ בְכָל לֵב חָנֵּנִי כְּאִמְרָתֶךָ: חִשַּׁבְתִּי דְרָכָי וָאָשִׁיבָה רַגְלַי אֶל עֵדֹתֶיךָ: חַשְׁתִּי וְלֹא הִתְמַהְמָהְתִּי לִשְׁמֹר מִצְו‍ֹתֶיךָ: חֶבְלֵי רְשָׁעִים עִוְּדֻנִי תּוֹרָתְךָ לֹא שָׁכָחְתִּי: חֲצוֹת לַיְלָה אָקוּם לְהוֹדוֹת לָךְ עַל מִשְׁפְּטֵי צִדְקֶךָ: חָבֵר אָנִי לְכָל אֲשֶׁר יְרֵאוּךָ וּלְשֹׁמְרֵי פִּקּוּדֶיךָ: חַסְדְּךָ יְהֹוָה מָלְאָה הָאָרֶץ חֻקֶּיךָ לַמְּדֵנִי:", "סֵעֲפִים שָׂנֵאתִי וְתוֹרָתְךָ אָהָבְתִּי: סִתְרִי וּמָגִנִּי אָתָּה לִדְבָרְךָ יִחָלְתִּי: סוּרוּ מִמֶּנִּי מְרֵעִים וְאֶצְּרָה מִצְו‍ֹת אֱלֹהָי: סָמְכֵנִי כְאִמְרָתְךָ וְאֶחְיֶה וְאַל תְּבִישֵׁנִי מִשִּׂבְרִי: סְעָדֵנִי וְאִוָּשֵׁעָה וְאֶשְׁעָה בְחֻקֶּיךָ תָמִיד: סָלִיתָ כָּל שֹׁגִים מֵחֻקֶּיךָ כִּי שֶׁקֶר תַּרְמִיתָם: סִגִים הִשְׁבַּתָּ כָל רִשְׁעֵי אָרֶץ לָכֵן אָהַבְתִּי עֵדֹתֶיךָ: סָמַר מִפַּחְדְּךָ בְשָׂרִי וּמִמִּשְׁפָּטֶיךָ יָרֵאתִי:", "Space", "בַּמֶּה יְזַכֶּה נַּעַר אֶת אָרְחוֹ לִשְׁמֹר כִּדְבָרֶךָ: בְּכָל לִבִּי דְרַשְׁתִּיךָ אַל תַּשְׁגֵּנִי מִמִּצְו‍ֹתֶיךָ: בְּלִבִּי צָפַנְתִּי אִמְרָתֶךָ לְמַעַן לֹא אֶחֱטָא לָךְ: בָּרוּךְ אַתָּה יְהֹוָה לַמְּדֵנִי חֻקֶּיךָ: בִּשְׂפָתַי סִפַּרְתִּי כֹּל מִשְׁפְּטֵי פִיךָ: בְּדֶרֶךְ עֵדְו‍ֹתֶיךָ שַׂשְׂתִּי כְּעַל כָּל הוֹן: בְּפִקּוּדֶיךָ אָשִׂיחָה וְאַבִּיטָה אֹרְחֹתֶיךָ: בְּחֻקֹּתֶיךָ אֶשְׁתַּעֲשָׁע לֹא אֶשְׁכַּח דְּבָרֶךָ:", "נֵר לְרַגְלִי דְבָרֶךָ וְאוֹר לִנְתִיבָתִי: נִשְׁבַּעְתִּי וָאֲקַיֵּמָה לִשְׁמֹר מִשְׁפְּטֵי צִדְקֶךָ: נַעֲנֵיתִי עַד מְאֹד יְהֹוָה חַיֵּנִי כִדְבָרֶךָ: נִדְבוֹת פִּי רְצֵה נָא יְהֹוָה וּמִשְׁפָּטֶיךָ לַמְּדֵנִי: נַפְשִׁי בְכַפִּי תָמִיד וְתוֹרָתְךָ לֹא שָׁכָחְתִּי: נָתְנוּ רְשָׁעִים פַּח לִי וּמִפִּקּוּדֶיךָ לֹא תָעִיתִי: נָחַלְתִּי עֵדְו‍ֹתֶיךָ לְעוֹלָם כִּי שְׂשׂוֹן לִבִּי הֵמָּה: נָטִיתִי לִבִּי לַעֲשׂוֹת חֻקֶּיךָ לְעוֹלָם עֵקֶב:", "Space", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:", "רְאֵה עָנְיִי וְחַלְּצֵנִי כִּי תוֹרָתְךָ לֹא שָׁכָחְתִּי: רִיבָה רִיבִי וּגְאָלֵנִי לְאִמְרָתְךָ חַיֵּנִי: רָחוֹק מֵרְשָׁעִים יְשׁוּעָה כִּי חֻקֶּיךָ לֹא דָרָשׁוּ: רַחֲמֶיךָ רַבִּים | יְהֹוָה כְּמִשְׁפָּטֶיךָ חַיֵּנִי: רַבִּים רֹדְפַי וְצָרָי מֵעֵדְו‍ֹתֶיךָ לֹא נָטִיתִי: רָאִיתִי בֹגְדִים וָאֶתְקוֹטָטָה אֲשֶׁר אִמְרָתְךָ לֹא שָׁמָרוּ: רְאֵה כִּי פִקּוּדֶיךָ אָהָבְתִּי יְהֹוָה כְּחַסְדְּךָ חַיֵּנִי: רֹאשׁ דְּבָרְךָ אֱמֶת וּלְעוֹלָם כָּל מִשְׁפַּט צִדְקֶךָ:", "יָדֶיךָ עָשׂוּנִי וַיְכוֹנְנוּנִי הֲבִינֵנִי וְאֶלְמְדָה מִצְו‍ֹתֶיךָ: יְרֵאֶיךָ יִרְאוּנִי וְיִשְׂמָחוּ כִּי לִדְבָרְךָ יִחָלְתִּי: יָדַעְתִּי יְהֹוָה כִּי צֶדֶק מִשְׁפָּטֶיךָ וֶאֱמוּנָה עִנִּיתָנִי: יְהִי נָא חַסְדְּךָ לְנַחֲמֵנִי כְּאִמְרָתְךָ לְעַבְדֶּךָ: יְבֹאוּנִי רַחֲמֶיךָ וְאֶחְיֶה כִּי תוֹרָתְךָ שַׁעֲשֻׁעָי: יֵבֹשׁוּ זֵדִים כִּי שֶׁקֶר עִוְּתוּנִי אֲנִי אָשִׂיחַ בְּפִקּוּדֶיךָ: יָשׁוּבוּ לִי יְרֵאֶיךָ וְיֹדְעֵי (כתיב וְיֹדְעֵו) עֵדֹתֶיךָ: יְהִי לִבִּי תָמִים בְּחֻקֶּיךָ לְמַעַן לֹא אֵבוֹשׁ:", "מָה אָהַבְתִּי תוֹרָתֶךָ כָּל הַיּוֹם הִיא שִׂיחָתִי: מֵאֹיְבַי תְּחַכְּמֵנִי מִצְו‍ֹתֶךָ כִּי לְעוֹלָם הִיא לִי: מִכָּל מְלַמְּדַי הִשְׂכַּלְתִּי כִּי עֵדְו‍ֹתֶיךָ שִׂיחָה לִי: מִזְּקֵנִים אֶתְבּוֹנָן כִּי פִקּוּדֶיךָ נָצָרְתִּי: מִכָּל אֹרַח רָע כָּלִאתִי רַגְלָי לְמַעַן אֶשְׁמֹר דְּבָרֶךָ: מִמִּשְׁפָּטֶיךָ לֹא סָרְתִּי כִּי אַתָּה הוֹרֵתָנִי: מַה נִּמְלְצוּ לְחִכִּי אִמְרָתֶךָ מִדְּבַשׁ לְפִי: מִפִּקּוּדֶיךָ אֶתְבּוֹנָן עַל כֵּן שָׂנֵאתִי | כָּל אֹרַח שָׁקֶר:"]



   
    var dataModel: DataModel!
    
    var mispaleli1: Mispaleli!
    
    
    let cellIdentifier = "NameTableViewCell"
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.view.semanticContentAttribute = .forceRightToLeft
        navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
        
        //print("The state of data model is \(dataModel.peopleArray.debugDescription)")
        
        mispaleli1 =
            
            Mispaleli(displayStringForName: aviDisplayString, hebrewLettersArray: aviHebrewLettersArray, kapitelStringsArray: aviKapitelStringsArray)
      
    }
    
    
        
    
    // MARK:- Table View DataSource and Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.peopleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameTableViewCell
        let person = dataModel.peopleArray[indexPath.row]
        cell.nameLabel.text = person.nameToDisplay
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        controller.delegate = self
        let person = dataModel.peopleArray[indexPath.row]
        controller.personToEdit = person
        present(controller, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        dataModel.peopleArray.remove(at: index)
        dataModel.savePeopleToDisk()
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      if !isEditing {
        let controller = storyboard!.instantiateViewController(withIdentifier: "NameDetailViewController") as! NameDetailViewController
         let selectedPerson = dataModel.peopleArray[indexPath.item]
        controller.selectedPerson = selectedPerson
        
        if selectedPerson.lettersArray.count > 0  {
        
        navigationController?.pushViewController(controller, animated: true)
          }
        }
     }

    
    
    @IBAction func addNameTapped(_ sender: Any) {
        let controller = storyboard!.instantiateViewController(withIdentifier: "AddEditViewController") as! AddEditViewController
        controller.delegate = self
        
       present(controller, animated: true, completion: nil)
    }
    
    
    
   
    
}
    
extension MasterViewController: AddEditViewControllerDelegate {
    
    func addEditViewController(_ controller: AddEditViewController, didFinishAdding person: Person) {
        
        //print("add person invoked")
        
        
        dataModel.peopleArray.append(person)
        dataModel.savePeopleToDisk()
        
        //let newRowIndex = dataModel.peopleArray.count + 1
        //let indexPath = IndexPath(row: newRowIndex, section: 0)
        //let indexPaths = [indexPath]
        //tableView.insertRows(at: indexPaths, with: .automatic)
        tableView.reloadData()
        
        
       // print("the current person is \(person.nameToDisplay)\(person.lettersArray)")
        
    }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishEditing person: Person) {
        
         let index = dataModel.peopleArray.index(of: person)
         dataModel.savePeopleToDisk()
        
        let indexPath = IndexPath(row: index!, section: 0)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
    
    func addEditViewController(_ controller: AddEditViewController, didFinishDeleting person: Person) {
        
        let index = dataModel.peopleArray.index(of: person)
        dataModel.peopleArray.remove(at: index!)
        dataModel.savePeopleToDisk()
        
        let indexPath = IndexPath(row: index!, section: 0)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    
extension MasterViewController : UITextFieldDelegate {
    
}

