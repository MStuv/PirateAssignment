//
//  MASViewController.m
//  Pirate Adventure
//
//  Created by Mark Stuver on 10/9/13.
//  Copyright (c) 2013 Halo International Corp. All rights reserved.
//

#import "MASViewController.h"
#import "MASFactory.h"
#import "MASTile.h"
#import "MASBoss.h"




@interface MASViewController ()

@end

@implementation MASViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetGameSettings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction Buttons

/// Up Direction Button
- (IBAction)upButton:(id)sender {
    
    self.positionPoint = CGPointMake(self.positionPoint.x, self.positionPoint.y +1);
    [self updateButtons];
    [self updateTile];
}
/// Right Direction Button
- (IBAction)rightButton:(UIButton *)sender {
    self.positionPoint = CGPointMake(self.positionPoint.x +1, self.positionPoint.y);
    [self updateButtons];
    [self updateTile];
}
/// Down Direction Button
- (IBAction)downButton:(UIButton *)sender {
    self.positionPoint = CGPointMake(self.positionPoint.x, self.positionPoint.y -1);
    [self updateButtons];
    [self updateTile];
}
/// Left Direction Button
- (IBAction)leftButton:(UIButton *)sender {
    self.positionPoint = CGPointMake(self.positionPoint.x -1, self.positionPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButton:(UIButton *)sender {
    UIAlertView *alertView  = [[UIAlertView alloc]initWithTitle:@"Warning!" message:@"Do you want to reset the game?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset Game",nil];
    [alertView show];
}

- (IBAction)actionButton:(UIButton *)sender {
    MASTile *tile = [[self.gameTiles objectAtIndex:self.positionPoint.x] objectAtIndex:self.positionPoint.y];
    [self updateCharacterStatForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.effectOnHealth];
    if (tile.effectOnHealth == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    [self updateTile];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView  = [[UIAlertView alloc]initWithTitle:@"Ye Dead!" message:@"Admiral NoBeard has defeated ye! Reset the game to play again!" delegate:self cancelButtonTitle:@"Reset Game" otherButtonTitles:nil];
        [alertView show];
    }
    else if (self.boss.health <=0) {
        UIAlertView *alertView  = [[UIAlertView alloc]initWithTitle:@"Ye Won!" message:@"Hurray Cap'n!! Ye defeated the evil Admiral NoBeard! Reset the game to play again!" delegate:self cancelButtonTitle:@"Reset Game" otherButtonTitles:nil];
        [alertView show];

    }
}

#pragma mark - Helper Methods
/// Helper Methods are only used on the implementation side of the class it is created in (for "internal" use)

-(void)updateTile
{
/** Creating an "internal" instance of MASTile and setting the tile...
    ...to the Current Coordinate:
            • The 1st objectAtIndex: is setting the "column" based on 1 of the 4 embedded arrays inside the gameTiles array
            • The 2nd objectAtIndex: is setting the "row" based on 1 of the 3 tiles that are contained inside the "column"
    ...to the current story ... etc.... **/
    MASTile *tileModel = [[self.gameTiles objectAtIndex:self.positionPoint.x] objectAtIndex:self.positionPoint.y];
    self.storyLabel.text = tileModel.story;
    self.tileImageView.image = tileModel.background;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.armorLabel.text = self.character.characterArmor.armorName;
    self.weaponLabel.text = self.character.characterWeapon.weaponName;
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    [self.actionButtonLabel setTitle:tileModel.actionLabel forState:UIControlStateNormal];
    
    if (tileModel.effectOnHealth == -15) {
        self.bossHealthLabel.hidden = NO;
        self.bossHealth.text = [NSString stringWithFormat:@"%i", self.boss.health];
    } else {
        self.bossHealthLabel.hidden = YES;
    }
}

-(void)updateButtons
{/// To determine if a direction button should be hidden, call method tileExistsAtPoint: with the current point position - or + to determine if a tile exsists in the next position.
    
    /// Is there another tile to the left of the current tile? if so, set hidden to NO, if not, set hidden to YES.
    self.leftButtonView.hidden = [self tileExistsAtPoint:CGPointMake(self.positionPoint.x - 1, self.positionPoint.y)];
    /// Is there another tile to the right of the current tile? if so, set hidden to NO, if not, set hidden to YES.
    self.rightButtonView.hidden = [self tileExistsAtPoint:CGPointMake(self.positionPoint.x +1, self.positionPoint.y)];
    /// Is there another tile to the top of the current tile? if so, set hidden to NO, if not, set hidden to YES.
    self.upButtonView.hidden = [self tileExistsAtPoint:CGPointMake(self.positionPoint.x, self.positionPoint.y +1)];
    /// Is there another tile to the bottom of the current tile? if so, set hidden to NO, if not, set hidden to YES.
    self.downButtonView.hidden = [self tileExistsAtPoint:CGPointMake(self.positionPoint.x, self.positionPoint.y -1)];
}

-(BOOL)tileExistsAtPoint:(CGPoint)point
{ /** The following if statement in english:
       If:  •  y & x are greater or equal to 0 ...
            • and x is less then the count of "columns" (embedded arrays in gameTiles)...
            • and y is less then the count of "tiles" in the current column...
            • then return NO - don't hide the button because a tile exists.**/
    if (point.y >= 0 && point.x >= 0 && point.x < [self.gameTiles count] && point.y < [[self.gameTiles objectAtIndex:point.x] count]) {
        return NO;
        /// Else... return YES - hide the button because a tile does not exist.
    } else {
        return YES;
    }
}

-(void)updateCharacterStatForArmor:(MASArmor *)armor withWeapon:(MASWeapon *)weapon withHealthEffect:(int)effectOnHealth
{/** What the if statement is saying... in English:
        If the armor instance that is being passed to this method is empty (nil)... do this:
            - make the current health equal to...
                • the current health minus the current armor instance's healthIncrease value (removing the current armor)...
                • then add the new armor instance's healthIncease value.
            - then make the current armor instance equal the new armor instance (drop old armor and pickup new armor) **/
    if (armor != nil) {
        self.character.health = self.character.health - self.character.characterArmor.healthIncrease + armor.healthIncrease;
        self.character.characterArmor = armor;
    }
    else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.characterWeapon.damageIncrease + weapon.damageIncrease;
        self.character.characterWeapon = weapon;
    }
    else if (effectOnHealth !=0) {
        self.character.health = self.character.health + effectOnHealth;
    } else {
        self.character.health = self.character.health + self.character.characterArmor.healthIncrease;
        self.character.damage = self.character.damage + self.character.characterWeapon.damageIncrease;
    }
}


/// Method that resets values of game properties
-(void)resetGameSettings
{
    MASFactory *factory = [[MASFactory alloc] init];
    self.gameTiles = [factory gameTiles];
    self.positionPoint = CGPointMake(0,0);
    self.character = [factory gameCharacter];
    self.boss = [factory boss];
    [self updateTile];
    [self updateButtons];
    [self updateCharacterStatForArmor:nil withWeapon:nil withHealthEffect:0];

}

#pragma mark - Delegate Methods

/// UIAlertView delegate method that is called when 'Reset Game' button is pressed inside alertView
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *alertButtonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([alertButtonTitle isEqualToString:@"Reset Game"]) {
        [self resetGameSettings];
    }
}



@end
