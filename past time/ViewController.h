//
//  ViewController.h
//  past time
//
//  Created by Jason Ginsberg on 7/8/13.
//  Copyright (c) 2013 Jason Ginsberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiDialViewController.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, UISearchBarDelegate, MultiDialViewControllerDelegate>{
    MultiDialViewController *multiDialController;
    
}

@property (nonatomic, retain) IBOutlet UILabel *selectedStringLabel;
@property (nonatomic, retain) IBOutlet UITextView *presetStringsView;

- (IBAction)switchPresetStrings:(id)sender;


@property (weak, nonatomic) IBOutlet UIScrollView *monthPicker;
@property (weak, nonatomic) IBOutlet UIScrollView *dayPicker;
@property (weak, nonatomic) IBOutlet UIScrollView *yearPicker;
@property (nonatomic) IBOutlet NSMutableArray *monthLabels;
@property (nonatomic) IBOutlet NSMutableArray *monthObjects;
@property (nonatomic) IBOutlet NSMutableArray *dayObjects;
@property (nonatomic) IBOutlet NSMutableArray *yearObjects;
@property (nonatomic, retain) IBOutlet UITableView *monthTable;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBackground;
@property (weak, nonatomic) IBOutlet UIScrollView *homeScroll;
@property (weak, nonatomic) IBOutlet UIImageView *scrollBackground;
- (IBAction)goButton:(id)sender;
@property int pageNumber;
@property BOOL goPressed;
- (IBAction)enterButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (weak, nonatomic) IBOutlet UIButton *enter;
@property (weak, nonatomic) IBOutlet UIButton *go;
@property (weak, nonatomic) IBOutlet UIView *allPickView;
@property float baseOffset;
@property float offsetStep;
@property (weak, nonatomic) IBOutlet UIButton *arrowRight;
@property (weak, nonatomic) IBOutlet UIButton *arrowLeft;
- (IBAction)arrowRight:(id)sender;
- (IBAction)arrowLeft:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *searchTOp;
@property (nonatomic) BOOL test;

@end
