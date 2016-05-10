//
//  BoardViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 4/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "BoardViewController.h"

@implementation BoardViewController

Game * game;
int seconds;
int secondsLeft;

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    game = appDelegate.game;
    game.player.score = 0;
    /**
     * Add observer and call method to invalidate the timer when the app go to background 
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pauseTimer:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    /**
     * Add observer to resume timer when app go back to forground
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resumeTimer:) name:UIApplicationWillEnterForegroundNotification object:nil];
    secondsLeft = GAME_DURATION;
    [game updateBubbleArray];
    
    /**
     * Add bubbles to view with animation
     */
    for (Bubble *b in [game bubbleArray]) {
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                              initWithTarget:self action:@selector(handleSingleTap:)];
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [b addGestureRecognizer:singleTapGestureRecognizer];
        [UIView transitionWithView:self.view
                          duration:ANIMATION_DURATION
                           options:UIViewAnimationOptionCurveEaseIn //any animation
                        animations:^ { [self.view addSubview:b]; }
                        completion:nil];
    }

    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * update bubble array by removing random bubbles and adding new bubbles, 
 * then update the view
 */
- (void)updateView
{
    /**
     * Check if the count down reach 0
     * if not, continue update view
     * if yes, save player score and change to score board view
     */
    if(secondsLeft > 0) {
        secondsLeft--;
        self.timerLabel.text = [NSString stringWithFormat:@"%02d", secondsLeft];
        
        NSArray *deleteBubbles = [game updateBubbleArray];
        
        for (Bubble *bubble in deleteBubbles) {
            [UIView transitionWithView:self.view
                              duration:ANIMATION_DURATION
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                [bubble removeFromSuperview];
                            }
                            completion:nil];

        }
        
        NSArray *subView = [self.view subviews];
        
        for (Bubble *b in [game bubbleArray]) {
            if (![subView containsObject:b]) {
                UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                                      initWithTarget:self action:@selector(handleSingleTap:)];
                singleTapGestureRecognizer.numberOfTapsRequired = 1;
                [b addGestureRecognizer:singleTapGestureRecognizer];
                [UIView transitionWithView:self.view duration:ANIMATION_DURATION
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    [self.view addSubview:b];
                                } completion:nil];
            }
        }
        
        for (UIView *uiView in subView) {
            if (uiView.tag == SCORE_LABEL_TAG) {
                [UIView transitionWithView:self.view duration:ANIMATION_DURATION
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    [uiView removeFromSuperview];
                                } completion:nil];
            }
        }
        
        if (secondsLeft < 20 && secondsLeft > 10) {
            self.timerLabel.textColor = [UIColor orangeColor];
        } else if (secondsLeft <= 10){
            self.timerLabel.textColor = [UIColor redColor];
        } else {
            self.timerLabel.textColor = [UIColor greenColor];
        }

    } else {
        [self.timer invalidate];
        [game saveScore];
        UIViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreViewController"];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

/**
 * check if bubble is tapped, update and remove bubble if so
 * @param {UITapGestureRecognizer *} recognizer [description]
 */
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    Bubble *bubble = (Bubble *) recognizer.view;
    
    [UIView transitionWithView:self.view duration:ANIMATION_DURATION
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [bubble removeFromSuperview];
                    } completion:nil];
    
    int newScore = [game calculateScore:bubble];
    game.player.score += newScore;
    UILabel *scoreLabel = [[UILabel alloc] init];
    
    scoreLabel.frame = CGRectMake(bubble.frame.origin.x + 5, bubble.frame.origin.y + 10, bubble.frame.size.width, bubble.frame.size.height);
    scoreLabel.textColor = bubble.color;
    scoreLabel.tag = SCORE_LABEL_TAG;
    scoreLabel.text = [NSString stringWithFormat:@"+%d", newScore];
    
    [self.view addSubview:scoreLabel];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", game.player.score];
}

/**
 * Ivalidate the timer
 */
-(void)pauseTimer:(NSNotification *)notification
{
    [self.timer invalidate];
}

/**
 * Re-add timer to the app
 */
-(void)resumeTimer:(NSNotification *)notification
{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
