//
//  SXLoginVC.m
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/7/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//

#import "SXAPIManager.h"
#import "SXLoginVC.h"
#import "SXCatListTableVC.h"

@interface SXLoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) UIGestureRecognizer *tapper;
@property (strong, nonatomic) UITextField *currentlyEditingTextField;

@end

@implementation SXLoginVC

#pragma mark - View Lifecycle Overrides

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    self.tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tapper];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

#pragma mark - Private Methods

- (IBAction)loginButtonTapped:(id)sender
{
    [self beginLogin];
}

- (void)beginLogin
{
    SXAPIManager *manager = [SXAPIManager sharedInstance];
    SXLoginVC __weak *weakSelf = self;
    NSDictionary *parameters = @{@"email": self.emailTextField.text, @"password": self.passwordTextField.text};
    [manager POST:@"/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        SXLoginVC *strongSelf = weakSelf;
        strongSelf.data = responseObject;
        [strongSelf performSegueWithIdentifier:@"masterCatListSegue" sender:self];
//        [manager.requestSerializer setValue:[responseObject objectForKey:@"access_token"] forHTTPHeaderField:@"access_token"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.currentlyEditingTextField resignFirstResponder];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"masterCatListSegue"])
    {
        SXCatListTableVC *destVC = segue.destinationViewController;
        destVC.catArray = [self.data objectForKey:@"cats"];
    }
}

#pragma mark - UITextField Delegate

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentlyEditingTextField = textField;
}

//for resigning on done button
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
