//
//  ViewController.swift
//  AnimationApp
//
//  Created by Pandos on 27.02.2021.
//

import Spring

class ViewController: UIViewController {
    
    private let animations = Animation.getAnimations()
    private var currentAnimation = 0

    @IBOutlet weak var springView: SpringView!
    
    @IBOutlet weak var buttonStartLabel: UIButton!
    
    @IBOutlet weak var nameAnimationLabel: UILabel!
    @IBOutlet weak var curveAnimationLabel: UILabel!
    @IBOutlet weak var forceAnimationLabel: UILabel!
    @IBOutlet weak var durationAnimationLabel: UILabel!
    @IBOutlet weak var dampingAnimationLabel: UILabel!
    @IBOutlet weak var velocityAnimationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateUI()
    }
    
    private func updateUI() {
        buttonStartLabel.setTitle("Run: \(animations[currentAnimation].name)",for: .normal)
        
        nameAnimationLabel.text = "Name: \(animations[currentAnimation].name)"
        curveAnimationLabel.text = "Curve: \(animations[currentAnimation].curve)"
        forceAnimationLabel.text = String(format: "Force: %.1f", animations[currentAnimation].force)
        durationAnimationLabel.text = String(format: "Duration: %.1f", animations[currentAnimation].duration)
        dampingAnimationLabel.text = String(format: "Damping: %.1f", animations[currentAnimation].damping)
        velocityAnimationLabel.text = String(format: "Velocity: %.1f", animations[currentAnimation].velocity)
    }
    
    @IBAction func buttonStartAction() {
        
        let animation = animations[currentAnimation]
        springView.animation = animation.name
        springView.curve = animation.curve
        springView.force = animation.force
        springView.duration = animation.duration
        springView.damping = animation.damping
        springView.velocity = animation.velocity
        springView.animate()
        
        currentAnimation += 1
        
        if currentAnimation >= animations.count {
            currentAnimation = 0
        }
        
        updateUI()
    }
    
}

