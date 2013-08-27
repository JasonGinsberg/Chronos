//
//  ViewController.m
//  past time
//
//  Created by Jason Ginsberg on 7/8/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import "MultiDialViewController.h"
#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize selectedStringLabel, presetStringsView;


- (void)viewDidLoad
{
    [super viewDidLoad];    
    _searchBar.delegate = self;
    _test = YES;
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    multiDialController = [[MultiDialViewController alloc] init];
    multiDialController.delegate = self;
    multiDialController.view.frame = CGRectOffset(multiDialController.view.frame, 0.0, 205.0);
    [self.view addSubview:multiDialController.view];
    [self.view sendSubviewToBack:multiDialController.view];
    //init
    [self switchPresetStrings:nil];

    _baseOffset = self.yearPicker.contentOffset.y;
    
    _offsetStep = 205*2 * floorf(self.yearPicker.bounds.size.height / 205*2);
    
    _goPressed = NO;
    _homeScroll.delegate = self;
    _homeScroll.clipsToBounds = YES;
    _homeScroll.alwaysBounceHorizontal = YES;
    _homeScroll.alwaysBounceVertical = NO;
    
    
    //////////
    
    _monthLabels = [[NSMutableArray alloc] init];
    _monthObjects = [[NSMutableArray alloc] init];
    _dayObjects = [[NSMutableArray alloc] init];
    _yearObjects = [[NSMutableArray alloc] init];
    
    _monthPicker.delegate = self;
    _dayPicker.delegate = self;
    _yearPicker.delegate = self;
    _yearPicker.clipsToBounds = YES;
    
    _dayPicker.alwaysBounceVertical = YES;
    _yearPicker.alwaysBounceVertical = YES;
    _monthPicker.alwaysBounceVertical = YES;
    
    _dayPicker.pagingEnabled = NO;
    _yearPicker.pagingEnabled = NO;
    _monthPicker.pagingEnabled = NO;
    
    [_monthLabels addObject:@"January"];
    [_monthLabels addObject:@"February"];
    [_monthLabels addObject:@"March"];
    [_monthLabels addObject:@"April"];
    [_monthLabels addObject:@"May"];
    [_monthLabels addObject:@"June"];
    [_monthLabels addObject:@"July"];
    [_monthLabels addObject:@"August"];
    [_monthLabels addObject:@"September"];
    [_monthLabels addObject:@"October"];
    [_monthLabels addObject:@"November"];
    [_monthLabels addObject:@"December"];
    
    
    NSInteger viewcount= 7;
    
    _homeScroll.contentSize = CGSizeMake(self.view.frame.size.width*viewcount, 214);
    
    _homeScroll.backgroundColor = [UIColor clearColor];
    
    
    for (int i = 0; i< viewcount; i++) {
        
        CGFloat x = i * self.view.frame.size.width;
        
        UIButton *viewBackground =[[UIButton alloc]initWithFrame:CGRectMake(x,0, self.view.frame.size.width, 214)];
        if (i==0){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"sportsLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==1){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"internetLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==2){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"stockLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==3){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"weatherLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==4){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"newsLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==5){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"musicLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==6){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"priceLayer.png"]forState:UIControlStateNormal];
        }
        else if (i==7){
            [viewBackground setBackgroundImage:[UIImage imageNamed:@"historyLayer.png"]forState:UIControlStateNormal];
        }
        [_homeScroll addSubview:viewBackground];
    }
    
    
    
    
    viewcount= 12;
    
    _monthPicker.contentSize = CGSizeMake(0, 205 *viewcount);
    
    for (int i = 0; i< viewcount; i++) {
        
        CGFloat y = i * 205/3;
        
        UILabel *text =[[UILabel alloc]initWithFrame:CGRectMake(15, y+15, 160, 20)];
        text.backgroundColor = [UIColor clearColor];
        text.textColor=[UIColor blackColor];
        text.font = [UIFont fontWithName:@"Avenir Light" size:18];
        text.text =[NSString stringWithFormat:@"%@",[_monthLabels objectAtIndex:i]];
        [_monthPicker addSubview:text];
        [_monthObjects addObject:text];
    }
    
    
    viewcount= 31;
    _dayPicker.contentSize = CGSizeMake(0, 205 *viewcount);
    for(int i = 0; i< viewcount; i++) {
        
        CGFloat y = i * 205/3;
        
        UILabel *text =[[UILabel alloc]initWithFrame:CGRectMake(50, y+15, 160, 20)];
        text.backgroundColor = [UIColor clearColor];
        text.textColor=[UIColor blackColor];
        text.font = [UIFont fontWithName:@"Avenir Light" size:18];
        text.text =[NSString stringWithFormat:@"%i",i+1];
        [_dayPicker addSubview:text];
        [_dayObjects addObject:text];
        
        
    }
    viewcount= 19;
    _yearPicker.contentSize = CGSizeMake(0, 205 *viewcount);
    for(int i = 0; i< viewcount; i++) {
        
        CGFloat y = i * 205/3;
        
        if (i<viewcount-1){
        UILabel *text =[[UILabel alloc]initWithFrame:CGRectMake(25, y+15, 160, 20)];
        text.backgroundColor = [UIColor clearColor];
        text.textColor=[UIColor blackColor];
        text.font = [UIFont fontWithName:@"Avenir Light" size:18];
        text.text =[NSString stringWithFormat:@"%i",2013-i];
        [_yearPicker addSubview:text];
        [_yearObjects addObject:text];
        }
        else{
            UILabel *text =[[UILabel alloc]initWithFrame:CGRectMake(25, y+15, 160, 20)];
            text.backgroundColor = [UIColor clearColor];
            text.textColor=[UIColor blackColor];
            text.font = [UIFont fontWithName:@"Avenir Light" size:18];
            text.text =[NSString stringWithFormat:@"2013"];
            [_yearPicker addSubview:text];
            [_yearObjects addObject:text];
        }
        
    }
    
    
    
    
    
   	// Do any additional setup after loading the view, typically from a nib.
}
////////
/////
/////
///
////
///
//
#pragma mark IBActions
-(UIStatusBarStyle)preferredStatusBarStyle{
    if (_test==YES){
    return UIStatusBarStyleLightContent;
    }
    else{
        return UIStatusBarStyleDefault;
    }
}
- (void)switchPresetStrings:(id)sender {
    if ([(UISwitch *)sender isOn]) {
        multiDialController.presetStrings = [[NSArray alloc] initWithObjects:@"000A", @"111A", @"222B", @"333C", @"360D", nil];
    }
    else {
        multiDialController.presetStrings = nil;
        
    }
    self.presetStringsView.text = [NSString stringWithFormat:@"%@", multiDialController.presetStrings];
}
//

- (void)spinToRandom:(id)sender {
    [multiDialController spinToRandomString:YES];
}
-(void)setMyYear:(id)sender{
    //[multiDialController setMyYearLimit:sender];

}

//
#pragma mark MultiDialViewControllerDelegate methods

- (void)multiDialViewController:(MultiDialViewController *)controller didSelectString:(NSString *)string {
    self.selectedStringLabel.text = string;
}
//////////
////
///
///
///
//
//
//
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat unguidedOffsetY = targetContentOffset->y;
    CGFloat guidedOffsetY;
    
    if (unguidedOffsetY > 250/3) {
        int remainder = lroundf(unguidedOffsetY) % lroundf(205/3);
        if (remainder < (205/3)) {
            guidedOffsetY = unguidedOffsetY - remainder;
        }
        else {
            guidedOffsetY = unguidedOffsetY - remainder + 205/3;
        }
    }
    else {
        guidedOffsetY = 0;
    }
    
    targetContentOffset->y = guidedOffsetY;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}



-(void) showAnimation{
    NSLog(@"boom");
    if (_goPressed == NO){
        [UIView animateWithDuration:0.5
                         animations:^{
                             _bottomBackground.frame = CGRectMake(0, 418, _bottomBackground.frame.size.width, _bottomBackground.frame.size.height);
                         }];
        _cancel.hidden = NO;
        _enter.hidden = NO;
        
        _go.hidden = YES;
        _goPressed = YES;

    }
    else if (_goPressed==YES){
        [UIView animateWithDuration:0.5
                         animations:^{
                             _bottomBackground.frame = CGRectMake(0, 213, _bottomBackground.frame.size.width, _bottomBackground.frame.size.height);
                         }];
        _cancel.hidden = YES;
        _enter.hidden = YES;
        _go.hidden = NO;
        _goPressed = NO;

        
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = sender.frame.size.width;
    _pageNumber= floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if ([sender isEqual:_homeScroll]){
        if (_pageNumber==1){
            _arrowLeft.hidden = NO;
            [_scrollBackground setImage:[UIImage imageNamed:@"darkBlueBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"darkBlueBot.png"]];
            int date = 1996;
            [multiDialController setMyYearLimit:date];
        }
        else if (_pageNumber==2){
            [_scrollBackground setImage:[UIImage imageNamed:@"purpleBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"purpleBot.png"]];
            int date = 1980;
            [multiDialController setMyYearLimit:date];

        }
        else if (_pageNumber==3){
            [_scrollBackground setImage:[UIImage imageNamed:@"pinkBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"pinkBot.png"]];
            int date = 1945;
            [multiDialController setMyYearLimit:date];

        }
        else if (_pageNumber==4){
            [_scrollBackground setImage:[UIImage imageNamed:@"greenBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"greenBot.png"]];
            int date = 1890;
            [multiDialController setMyYearLimit:date];

        }
        
        else if (_pageNumber==5){
            _arrowRight.hidden = NO;
            [_scrollBackground setImage:[UIImage imageNamed:@"orangeBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"orangeBot.png"]];
            int date = 1960;
            [multiDialController setMyYearLimit:date];

        }
        else if (_pageNumber==6){
            _arrowRight.hidden = YES;
            [_scrollBackground setImage:[UIImage imageNamed:@"redBackground.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"redBot.png"]];
            int date = 1950;
            [multiDialController setMyYearLimit:date];

        }
        else if (_pageNumber==7){
            [_scrollBackground setImage:[UIImage imageNamed:@"background.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"bot.png"]];
            int date = 1990;
            [multiDialController setMyYearLimit:date];

        }
        else if (_pageNumber==0){
            _arrowLeft.hidden = YES;
            [_scrollBackground setImage:[UIImage imageNamed:@"background.png"]];
            [_bottomBackground setImage:[UIImage imageNamed:@"bot.png"]];
            int date = 1960;
            [multiDialController setMyYearLimit:date];

        }
    }
    else{
    
        
        for (UILabel *label in _yearObjects){
            float y = _yearPicker.contentOffset.y;
            if (y>1119){
                
            }
            NSLog(@"label: %@ , y: %f", label.text, y);
            if ( NSLocationInRange(label.frame.origin.y-y, NSMakeRange(83, (89-83)))){
                label.textColor = [UIColor blackColor];
            }
            else{
                label.textColor = [UIColor lightGrayColor];

            }
            }

            for (UILabel *label in _monthObjects){
                float y = _monthPicker.contentOffset.y;
                if ( NSLocationInRange(label.frame.origin.y-y, NSMakeRange(83, (89-83)))){
                    label.textColor = [UIColor blackColor];
                }
                else{
                    label.textColor = [UIColor lightGrayColor];
                    
                }
            for (UILabel *label in _dayObjects){
                float y = _dayPicker.contentOffset.y;
                if ( NSLocationInRange(label.frame.origin.y-y, NSMakeRange(83, (89-83)))){
                    label.textColor = [UIColor blackColor];
                }
                else{
                    label.textColor = [UIColor lightGrayColor];
                    
                }

                }
            }
        }
}


- (IBAction)goButton:(id)sender {
    [self showAnimation];
}
- (IBAction)enterButton:(id)sender {
    [self showAnimation];
    _test = NO;
    [self setNeedsStatusBarAppearanceUpdate];
    CGRect rect = CGRectMake(0.0, 20.0, 320.0, 44.0);
    CGRect top = CGRectMake(0.0, 0.0, 320.0, 20.0);
    [UIView animateWithDuration:0.2 animations:^ {
        [_searchBar setFrame:rect];
        [_searchBar setNeedsLayout];
        
        [_searchTOp setFrame:top];
        [_searchTOp setNeedsLayout];
    }];    [_searchBar becomeFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _test = YES;
    [self setNeedsStatusBarAppearanceUpdate];
    CGRect rect = CGRectMake(0.0, -44.0, 320.0, 44.0);
    CGRect top = CGRectMake(0.0, -64.0, 320.0, 20.0);
    [UIView animateWithDuration:0.2 animations:^ {
        [_searchBar setFrame:rect];
        [_searchBar setNeedsLayout];
        
        [_searchTOp setFrame:top];
        [_searchTOp setNeedsLayout];
    }];
    [_searchBar resignFirstResponder];
    [self clear];
}
-(void)clear{
    int currentPageOffsetX = _homeScroll.contentOffset.x;
    int currentPageOffsetY = _homeScroll.contentOffset.y;
    [UIView animateWithDuration:0.2 animations:^ {
        [_homeScroll setContentOffset:CGPointMake(currentPageOffsetX, currentPageOffsetY+_homeScroll.frame.size.height)];
    }];
    _arrowRight.hidden = YES;
    _arrowLeft.hidden = YES;
}

- (IBAction)cancelButton:(id)sender {
    [self showAnimation];
}
- (IBAction)arrowRight:(id)sender {
    int currentPageOffsetX = _homeScroll.contentOffset.x;
    int currentPageOffsetY = _homeScroll.contentOffset.y;
    [_homeScroll setContentOffset:CGPointMake(currentPageOffsetX+_homeScroll.frame.size.width, currentPageOffsetY) animated:YES];
}
- (IBAction)arrowLeft:(id)sender {
    int currentPageOffsetX = _homeScroll.contentOffset.x;
    int currentPageOffsetY = _homeScroll.contentOffset.y;
    [_homeScroll setContentOffset:CGPointMake(currentPageOffsetX-_homeScroll.frame.size.width, currentPageOffsetY) animated:YES];
}
@end
