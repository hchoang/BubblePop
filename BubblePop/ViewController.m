//
//  ViewController.m
//  BubblePop
//
//  Created by Huy Cat Hoang on 2/05/2016.
//  Copyright © 2016 Huy Cat Hoang. All rights reserved.
//

#import "ViewController.h"
#import "Bubble.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // load game object from appDelegate;
    self.game = appDelegate.game;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Check if player enter name
 */
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"startGame"]) {
        if ([[[self nameTextField] text] isEqualToString:@""]) {
            [[self nameTextField] becomeFirstResponder];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Please enter your name before starting the game" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];
            return false;
        }
        self.game.player.name = self.nameTextField.text;
        self.game.maxBubble = (int) [self.maxBubbleLabel.text integerValue];
    }
    return true;
}

/**
 * Resign first responder from textField when user click enter
 */
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

/**
 * Update label when stepperView is clicked
 * @param {UIStepper *} sender [description]
 */
- (IBAction)valueChange:(UIStepper *)sender {
    int maxBubble = [sender value];
    self.maxBubbleLabel.text = [NSString stringWithFormat:@"%d", maxBubble];
}

@end
