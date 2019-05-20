//
//  UIView+Extensions.swift
//  DevTo.iOS
//
//  Created by Hadi Dbouk on 5/14/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import UIKit

extension UIView : Reflection { }

//MARK: - Constaints
extension UIView {
    
    func stickToParentEdges() {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func widthConstraint(constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func heightConstraint(constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func topConstraint(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: constant).isActive = true
    }
    
    func trailingConstaint(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: constant).isActive = true
    }
    
    func bottomConstraint(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: constant).isActive = true
    }
    
    func leadingConstraint(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: constant).isActive = true
    }
    
    func aspectRatioConstraint(multiplier: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    //MARK: Constraints Depending on view
    func topConstaint(view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func trailingConstaint(onLeadingOf view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func bottomConstraint(onTopOf view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func topConstraint(onBottomOf view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    func leadingConstraint(onTrailingOf view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant).isActive = true
    }
    
    func leadingConstraint(view: UIView, constant: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
    }
    
    func widthConstraint(sameAs view: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    //MARK: - Center Constraints
    func centerToParentHorizontal() {
        
        centerToParentHorizontal(constant: 0)
    }
    
    func centerToParentHorizontal(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerVertical(dependingOn view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerToParentVertical() {
        
        centerToParentVertical(constant: 0)
    }
    
    func centerToParentVertical(constant: CGFloat) {
        
        guard let parentView = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: constant).isActive = true
    }
    
    //MARK: - Remove Contraints
    func removeConstraints() {
        
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []
        
        self.superview?.removeConstraints(constraints)
        self.removeConstraints(self.constraints)
    }
}

//MARK: - Others
extension UIView {
    func roundedCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
