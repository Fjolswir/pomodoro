//
//  ViewController.swift
//  Pomodoro App
//
//  Created by Admin on 21.07.2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var circle: UIImageView!
    
    @IBOutlet var star: UIImageView!
    
    @IBOutlet var textPomodoro: UILabel!
    
    @IBOutlet var path: UIImageView!
    
    @IBOutlet var play: UIImageView!
    
    @IBOutlet var work: UILabel!
    
    @IBOutlet var clickToStart: UILabel!
    
    @IBOutlet var playBtn: UIButton!
    
    @IBOutlet var pause: UIButton!
    
    @IBOutlet var clickToStop: UILabel!
    
    @IBOutlet var timer: UILabel!
    
    
    // Pomodoro Timer
    
    var pomodoroTimer = Timer()
    
    var time = 1500
    var pauseTime = 300
    
    
    func decreaseTimer() {
        
        if time > 0 {
            let minutes = String(time / 60)
            let seconds = String(time % 60)
            timer.text = minutes + ":" + seconds
            time -= 1
            
        }
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
        print("chuj")
        
        play.alpha = 0
        clickToStart.alpha = 0
        
        /pomodoroTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)

        
        UIView.animate(withDuration: 1) {
            
            self.pause.alpha = 1
            self.clickToStop.alpha = 1
            
        }
        
    }
    
    
    
    @IBAction func pauseBtn(_ sender: Any) {
        
        pomodoroTimer.invalidate()
        
        UIView.animate(withDuration: 1) {
            self.pause.alpha = 0
            self.play.alpha = 1
            self.clickToStop.alpha = 0
            self.clickToStart.alpha = 1
        }
        
    }
    
    // Pomodoro Timer ends
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        circle.alpha = 0
        star.alpha = 0
        textPomodoro.alpha = 0
        path.alpha = 0
        work.alpha = 0
        clickToStart.alpha = 0
        timer.alpha = 0
        play.alpha = 0
        pause.alpha = 0
        clickToStop.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Second view (work) funcs
        
        func showPlayButton() {
            UIView.animate(withDuration: 0.1, animations: {
                self.star.alpha = 0
                self.textPomodoro.alpha = 0
                self.path.alpha = 0
            })
            UIView.animate(withDuration: 1, animations: {
                self.play.alpha = 1
                self.work.alpha = 1
                self.clickToStart.alpha = 1
                self.timer.alpha = 1
                
            })
        }
        
        // App starting animations
        
        UIView.animate(withDuration: 1) {
            self.circle.alpha = 1
        }
        
        circle.center = CGPoint(x: circle.center.x + 500, y: circle.center.y)
        
        UIView.animate(withDuration: 0.5) {
            self.circle.center = CGPoint(x: self.circle.center.x - 500, y: self.circle.center.y)
        }
        
        UIView.animate(withDuration: 1, animations: {
            self.star.alpha = 1
        }) { (true) in
            showPlayButton()
        }
    
        star.center = CGPoint(x: star.center.x - 500, y: star.center.y)
        
        UIView.animate(withDuration: 0.5) {
            self.star.center = CGPoint(x: self.star.center.x + 500, y: self.star.center.y)
        }
        
        UIView.animate(withDuration: 1) {
            self.textPomodoro.alpha = 1
        }
        
        textPomodoro.center = CGPoint(x: textPomodoro.center.x + 500, y: textPomodoro.center.y)
        
        UIView.animate(withDuration: 0.8) {
            self.textPomodoro.center = CGPoint(x: self.textPomodoro.center.x - 500, y: self.textPomodoro.center.y)
        }
        
        
        UIView.animate(withDuration: 1) {
            self.path.alpha = 1
        }
        
        path.center = CGPoint(x: path.center.x - 500, y: path.center.y)
        
        
        UIView.animate(withDuration: 0.6) {
            self.path.center = CGPoint(x: self.path.center.x + 500, y: self.path.center.y)
        }
        
        // Second view functions (Work)
        

        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

