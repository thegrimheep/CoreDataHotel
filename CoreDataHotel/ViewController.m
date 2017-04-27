//
//  ViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

@import Crashlytics;
#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupLayout];
}

-(void)setupLayout {
    
    CGFloat topLayoutHeight = CGRectGetHeight(self.navigationController.navigationBar.frame) +20;
    CGFloat buttonHeight = (self.view.bounds.size.height - topLayoutHeight) / 3;
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor redColor];
    bookButton.backgroundColor = [UIColor darkGrayColor];
    lookupButton.backgroundColor = [UIColor blueColor];
    
    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstraintFrom:browseButton toView:self.view];
    [AutoLayout height:buttonHeight forView:browseButton];
    [AutoLayout topOffset:topLayoutHeight fromView:browseButton toView:self.view];

    [AutoLayout leadingConstraintFrom:bookButton toView:self.view];
    [AutoLayout trailingConstraintFrom:bookButton toView:self.view];
    [AutoLayout height:buttonHeight forView:bookButton];
    [AutoLayout topOffset:topLayoutHeight + buttonHeight fromView:bookButton toView:self.view];
    
    [AutoLayout leadingConstraintFrom:lookupButton toView:self.view];
    [AutoLayout trailingConstraintFrom:lookupButton toView:self.view];
    [AutoLayout height:buttonHeight forView:lookupButton];
    [AutoLayout topOffset:topLayoutHeight + 2* buttonHeight fromView:lookupButton toView:self.view];
    
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected) forControlEvents:UIControlEventTouchUpInside];
}

-(void)browseButtonSelected {
    
    [Answers logCustomEventWithName:@"View Controller Browse Button Pressed" customAttributes:nil];
    HotelsViewController *hotelViewController = [[HotelsViewController alloc] init];
    [self.navigationController pushViewController:hotelViewController animated:YES];
    
    NSLog(@"Work on this for lab");
}

-(void)bookButtonSelected {
    [Answers logCustomEventWithName:@"View Controller Book Button Pressed" customAttributes:nil];
    DatePickerViewController *datePickerController = [[DatePickerViewController alloc]init];
    [self.navigationController pushViewController:datePickerController animated:YES];
}

-(void)lookUpButtonPressed{
    NSLog(@"look Up Button ");
}

-(UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:normal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
