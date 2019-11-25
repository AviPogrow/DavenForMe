//
//  NameDetailViewController.swift
//  autolayout_lbta
//
//  Created by user on 5/9/19.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class NameDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate {
    
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    
    @IBOutlet weak var tehillimTextCollectionView: UICollectionView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let cellId = "cellId"
    let cellID2 = "cellId2"
    let pageCellID = "pageCellID"
    
    var currentNumber: Int = 0
    var topIndexReversed: [Int] = []
    var myIndexArray: [Int] = []
   
    
    var selectedPerson: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
      
         configureNavController()
        configureTopCollectionView()
        configureBottomCollectionView()
        
        currentNumber = selectedPerson.kapitelStringsArray.count - 1
        myIndexArray.append(currentNumber)
    }
    
    func configureNavController() {
        navigationController?.hidesBarsOnSwipe = false
        //navigationItem.title = currentMispaleli.displayStringForName
        let _ = UIFont(name: "SBLHebrew", size: 34)
        //navigationController?.navigationBar.titleTextAttributes = customFont
        //navigationItem.title = currentMispaleli.displayStringForName
        navigationItem.titleView?.backgroundColor = UIColor.red 
        navigationItem.title = selectedPerson.nameToDisplay
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func configureTopCollectionView() {
        
        let layout = menuBarCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        menuBarCollectionView.semanticContentAttribute = .forceRightToLeft
        menuBarCollectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId )
          menuBarCollectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellID2 )
        
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
        
        let index = 0
       let indexPath1 = IndexPath(item: index, section: 0)
       
       menuBarCollectionView.selectItem(at: indexPath1, animated: true, scrollPosition: .centeredHorizontally)
        //let lastIndex = selectedPerson.kapitelStringsArray.count - 1
        //let indexPath = IndexPath(item: lastIndex, section: 0)
        //tehillimTextCollectionView.scrollToItem(at: indexPath, at: .right, animated: true)
    }
    
   lazy   var leftRightPadding = view.frame.width * 0//0.10
    lazy   var interSpacing = view.frame.width * 0//0.1
    
   lazy   var totalEmptySpace = (view.frame.width - (2 * leftRightPadding) - (3 * interSpacing))
    
   lazy var totalEmptySpaceforLetters =  (menuBarCollectionView.frame.width - (2 * leftRightPadding) - (3 * interSpacing))
    
   lazy   var letterCellWidth = totalEmptySpace / CGFloat(selectedPerson.lettersArray.count)
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let  size = CGSize(width: 44, height:  menuBarCollectionView.bounds.height/3.7)
        
        if collectionView.tag == 101 {
         
            return size
            
       }
        else {

            return .init(width: tehillimTextCollectionView.bounds.width, height: tehillimTextCollectionView.bounds.height)
    }
     }
    
    // the spacing between each row of the keypad
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView.tag == 101 {
            return 5.0
        } else {
        return 0.0
        }
            
    }
    
    // spacing between column of each section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 101 {
            return          5.0//interSpacing
        } else {
            return 0
        }
    }
    
    // if we are in the second section with the back button and phone button
    // inset the cell from the left margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension NameDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 101 {
        
        
        return selectedPerson.lettersArray.count
        } else {
         
            return selectedPerson.kapitelStringsArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     if collectionView.tag == 101 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
    
        let lettr = selectedPerson.lettersArray[indexPath.item]

        let customFont = UIFont(name: "SBLHebrew", size: 30)
        cell.digitsLabel.font = customFont
        cell.digitsLabel.text = lettr
        
        return cell
        
        } else {
            
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellID, for: indexPath) as! PageCell
        
        var kapitelArray = [String]()
        kapitelArray = selectedPerson.kapitelStringsArray.reversed()
        
        let kapitel = kapitelArray[indexPath.row]
        
       
    
        let paragraphString = kapitelArray[indexPath.row]
          var arrayOfWords = [String]()
          
        var arrayOfSentences = [String]()
        //print("the paragraphString is\(paragraphString)")
        
        
        
        paragraphString.enumerateSubstrings(in: paragraphString.startIndex...,
                                            options: .bySentences)
            { sentence, _, _ , Boolean in
              if let sentence = sentence {
                
                arrayOfSentences.append(sentence)
                
               // print("\(arrayOfSentences) there are \(arrayOfSentences.count) sentences in this kapitel")
              }
            }
          
       
        
        
        // character emphasis vs word emphasis
        //get the first character and change its color
        
        let customFont = UIFont(name: "SBLHebrew", size: 28)
        pageCell.tehillim1TextView.font = customFont
        pageCell.tehillim1TextView.text = kapitel
        
        pageCell.tehillim1TextView.backgroundColor = UIColor.white
        
        let semantic = tehillimTextCollectionView.effectiveUserInterfaceLayoutDirection.rawValue
        
        //print("the semantic is \(semantic)")
        return pageCell
    }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return false 
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
                     
        //get the page number of bottom collectionView
        let pageNum = Int(scrollView.contentOffset.x / view.frame.width) + 1
                        
      
        let lastIndex =    selectedPerson.kapitelStringsArray.endIndex
       
        let topIndex = selectedPerson.kapitelStringsArray.index(lastIndex, offsetBy: -pageNum, limitedBy: 0)
            
        let indexPath = IndexPath(item: topIndex!, section: 0)
                        
        //menuBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            
            
        //if indexPath is at the end then set it to start
        
            
        // set the index of current kapit and persist it
        selectedPerson.indexOfCurrentKapitel = topIndex!
        
            
        let lastOpenIndex = selectedPerson.indexOfCurrentKapitel
        let lastOpenIndexPath = IndexPath(row: lastOpenIndex, section: 0)
         
        print("the person object state is \(selectedPerson.indexOfCurrentKapitel)")
            
        //if lastLetterRead is not zero then select the item at
        // index path

        menuBarCollectionView.selectItem(at: lastOpenIndexPath, animated: true, scrollPosition: .top)
            
            pageControl.currentPage = lastOpenIndex
                   
      
        }
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
