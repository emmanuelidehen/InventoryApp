//
//  OnboardingViewController.swift
//  onbaording
//
//  Copyright © 2018 Emmanuel Idehen. All rights reserved.//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // nib varibale we are going to use to register to the collection view
    let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
    
    // Array of our onboarding items
    var arrayOfOnboardingItems:[OnboardingItem] = [
        //OnboardingItem(title: "AMERICA", description: "SLIDE 1", image: )
        OnboardingItem(title: "WELCOME", description: "", image: #imageLiteral(resourceName: "1")),
        OnboardingItem(title: "TO THE", description: "", image: #imageLiteral(resourceName: "ghec-bookstore")),
        OnboardingItem(title: "VALLEY", description: "", image: #imageLiteral(resourceName: "Lib"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self // set delegate programmaticly
        collectionView.dataSource = self // set dataSource programmaticly
        
        // IMPORTANT! WE HAVE TO REISTER THE NIB IN ORDER TO USE IT!
        collectionView.register(nib, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        // MATH
        let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        let cgpoint = CGPoint(x: CGFloat(pageNumber + 1) * collectionView.bounds.size.width, y: 0)
        
        // We use -1 here because computers start counting at 0
        if userIsAtTheEndOfOnboarding(current: pageNumber, target: arrayOfOnboardingItems.count - 1){
            performSegue(withIdentifier: "showSignup", sender: self)
        } else {
            // Move the slide over to show the other onboarding
            collectionView.setContentOffset(cgpoint, animated: true)
        }
        
    }
    
    func userIsAtTheEndOfOnboarding(current:Int,target:Int) -> Bool{
        return current == target
        
      
        
    }
}


extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as!NewOnboardingCollectionViewCell
        let onboardingItem = arrayOfOnboardingItems[indexPath.section] // grabs onbaording item
        cell.titleLabel.text = onboardingItem.title
        cell.descriptionLabel.text = onboardingItem.description
        cell.imageView.image = onboardingItem.image
        
        return cell
    }
    
    // Collection view methods
    func numberOfSections(in collectionView: UICollectionView) -> Int { return arrayOfOnboardingItems.count }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Gives the size of the cell to fill up the collection view
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This fucntion is called everytime the scroll view scrolls
        // MATH 
        let pageNumber = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = pageNumber
        
        if userIsAtTheEndOfOnboarding(current: pageNumber, target: arrayOfOnboardingItems.count - 1){
            // Set the title of the buttons
            signupButton.setTitle("SignUp", for: .normal)
        } else {
            signupButton.setTitle("Next", for: .normal)
        }
    }
}
