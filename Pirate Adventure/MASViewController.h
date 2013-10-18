//
//  MASViewController.h
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/9/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MASCharacter.h"
#import "MASBoss.h"


@interface MASViewController : UIViewController <UIAlertViewDelegate>

#pragma mark - iVars
@property (nonatomic)CGPoint positionPoint;
@property (strong, nonatomic) NSArray *gameTiles;

@property (strong, nonatomic) MASCharacter *character;
@property (strong, nonatomic) MASBoss *boss;


#pragma mark - IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButtonLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIImageView *tileImageView;

@property (strong, nonatomic) IBOutlet UIButton *upButtonView;
@property (strong, nonatomic) IBOutlet UIButton *rightButtonView;
@property (strong, nonatomic) IBOutlet UIButton *downButtonView;
@property (strong, nonatomic) IBOutlet UIButton *leftButtonView;
@property (strong, nonatomic) IBOutlet UILabel *bossHealth;

@property (strong, nonatomic) IBOutlet UIView *bossHealthLabel;

#pragma mark - IBActions
- (IBAction)upButton:(UIButton *)sender;
- (IBAction)rightButton:(UIButton *)sender;
- (IBAction)downButton:(UIButton *)sender;
- (IBAction)leftButton:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;
- (IBAction)actionButton:(UIButton *)sender;



@end
