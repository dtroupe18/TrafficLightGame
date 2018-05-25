//
//  ViewController.m
//  TrafficLightGame
//
//  Created by Dave on 5/24/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
    // Load best score from user defaults
    bestScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)startStop:(id)sender {
    
    if (scoreInt == 0) {
        self.bestScoreLabel.hidden = YES;
        timerInt = 3; // count down
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight.png"];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        self.startButton.enabled = NO;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        [self.startButton setTitle:@"" forState:UIControlStateNormal]; // clear button title
    } else {
        [scoreTimer invalidate];
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        [self showBestScore];
    }
    
    if (timerInt == 0) {
        scoreInt = 0;
    }
}

-(void)showBestScore {
    if (bestScore != 0) {
        if (scoreInt < bestScore) {
            // show this score and save to user defaults
            self.bestScoreLabel.text = [NSString stringWithFormat:@"Best Score: %i", scoreInt];
            self.bestScoreLabel.hidden = NO;
            [self updateBestScore:scoreInt];
        } else {
            self.bestScoreLabel.text = [NSString stringWithFormat:@"Best Score: %li", (long)bestScore];
            self.bestScoreLabel.hidden = NO;
        }
    } else {
        self.bestScoreLabel.text = [NSString stringWithFormat:@"Best Score: %i", scoreInt];
        self.bestScoreLabel.hidden = NO;
        [self updateBestScore:scoreInt];
    }
}

-(void)updateBestScore: (NSInteger)score {
    [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"bestScore"];
    bestScore = score;
}

-(void)startTimer {
    timerInt -= 1;
    
    if (timerInt == 2) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight3.png"];
    } else if (timerInt == 1) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight2.png"];
    } else if (timerInt == 0) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight1.png"];
        self.startButton.enabled = YES;
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        [timer invalidate];
        
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
    }
}

-(void)scoreCounter {
    scoreInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

@end
