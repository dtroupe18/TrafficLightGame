//
//  ViewController.h
//  TrafficLightGame
//
//  Created by Dave on 5/24/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    NSTimer *scoreTimer;
    
    int timerInt;
    int scoreInt;
    NSInteger bestScore;
}

@property (weak, nonatomic) IBOutlet UIImageView *trafficLight;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *bestScoreLabel;

- (IBAction)startStop:(id)sender;


@end

