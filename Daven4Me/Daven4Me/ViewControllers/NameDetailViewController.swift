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
    
   
    let cellId = "cellId"
    let pageCellID = "pageCellID"
    
    

    var currentPageNumber: Int = 0
    var topIndexReversed: [Int] = []
    var myIndexArray: [Int] = []
   
    
    var selectedPerson: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
      
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
        navigationItem.title = selectedPerson.nameToDisplay
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
    
   lazy   var letterCellWidth = totalEmptySpace / CGFloat(selectedPerson.lettersArray.count)
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 101 {
          // if  currentMispaleli.hebrewLettersArray.count < 17 {
            
             //1/8 the width and 1/3 the height
        
            return .init(width: collectionView.frame.size.width / 8, height: menuBarCollectionView.bounds.height)
            
       }
        else {
        
        //let bottomCellWidth = view.frame.size.width - 40
            _ = view.frame.size.height - 200
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
        
        
        return selectedPerson.lettersArray.count
        } else {
         
            return selectedPerson.kapitelStringsArray.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     if collectionView.tag == 101 {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
    
        //let lettr  =  currentMispaleli.hebrewLettersArray[indexPath.item]
        
        let lettr = selectedPerson.lettersArray[indexPath.item]
        
        let customFont = UIFont(name: "SBLHebrew", size: 44)
        menuCell.lettrLabel.font = customFont
        menuCell.lettrLabel.text = lettr
        return menuCell
        
        } else {
            
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: pageCellID, for: indexPath) as! PageCell
    
        var kapitelArray = [String]()
        kapitelArray = selectedPerson.kapitelStringsArray.reversed()
        
        let kapitel = kapitelArray[indexPath.row]
        
        let customFont = UIFont(name: "SBLHebrew", size: 33)
        pageCell.tehillim1TextView.font = customFont
        pageCell.tehillim1TextView.text = kapitel
        
        //pageCell.page = kapitel
      
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
            
                let bottomPageNum = Int(scrollView.contentOffset.x / view.frame.width)
                
             
            
            //var normalIndex = topIndexReversed[bottomPageNum]
            
                _ = IndexPath(item: bottomPageNum, section: 0)
           
            //menuBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            
        }
    }
     func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        let currentPoint = CGPoint(x: targetContentOffset.pointee.x, y: 50)
        let currentIndexPathFromPoint = tehillimTextCollectionView.indexPathForItem(at: currentPoint)
        //let currentIndexPath = tehillimTextCollectionView.indexPath(for: //<#T##UICollectionViewCell#>)
        menuBarCollectionView.selectItem(at: currentIndexPathFromPoint, animated: true, scrollPosition: .top)
        
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
