//
//  ViewController.h
//  past time
//
//  Created by Jason Ginsberg on 7/8/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiDialViewController.h"
#import "AFNetworking.h"
#import "SBJSON.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, UISearchBarDelegate, MultiDialViewControllerDelegate>{
    MultiDialViewController *multiDialController;
    
}

@property (weak, nonatomic) IBOutlet UIView *allPickView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIScrollView *monthPicker;
@property (weak, nonatomic) IBOutlet UIScrollView *dayPicker;
@property (weak, nonatomic) IBOutlet UIScrollView *yearPicker;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBackground;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScroll;
@property (nonatomic) IBOutlet NSMutableArray *monthLabels;
@property (nonatomic) IBOutlet NSMutableArray *monthObjects;
@property (nonatomic) IBOutlet NSMutableArray *dayObjects;
@property (nonatomic) IBOutlet NSMutableArray *yearObjects;
@property (nonatomic, retain) IBOutlet UITableView *monthTable;

@property (weak, nonatomic) IBOutlet UIImageView *scrollBackground;
@property (weak, nonatomic) IBOutlet UIImageView *searchTOp;
@property (nonatomic, retain) IBOutlet UITextView *presetStringsView;
@property (nonatomic, retain) IBOutlet UILabel *selectedStringLabel;
@property (weak, nonatomic) IBOutlet UIButton *enter;
@property (weak, nonatomic) IBOutlet UIButton *go;

@property (weak, nonatomic) IBOutlet UIButton *arrowRight;
@property (weak, nonatomic) IBOutlet UIButton *arrowLeft;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *changeSearchButton;
@property (weak, nonatomic) IBOutlet UIButton *changeDateButton;

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet NSURL *url;
@property (weak, nonatomic) IBOutlet NSString *searchTerm;
@property (weak, nonatomic) IBOutlet NSString *month;
@property (weak, nonatomic) IBOutlet NSString *day;
@property (weak, nonatomic) IBOutlet NSString *year;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property int pageNumber;
@property float baseOffset;
@property float offsetStep;
@property (nonatomic) BOOL goPressed;
@property (nonatomic) BOOL searchON;
@property (nonatomic) BOOL test;
@property (nonatomic) BOOL pressedSearch;
@property (nonatomic) BOOL loadedSpecificView;
@property (nonatomic) BOOL changeDatePressed;
- (IBAction)switchPresetStrings:(id)sender;
- (IBAction)goButton:(id)sender;
- (IBAction)enterButton:(id)sender;
- (IBAction)arrowRight:(id)sender;
- (IBAction)arrowLeft:(id)sender;
- (IBAction)goHome:(id)sender;
- (IBAction)changeSearch:(id)sender;
- (IBAction)changeDate:(id)sender;
- (IBAction)confirm:(id)sender;
@end
