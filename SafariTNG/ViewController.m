//
//  ViewController.m
//  SafariTNG
//
//  Created by Adam Cooper on 10/1/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHomePage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.delegate = self;
    alert.title = @"Alert";
    alert.message = @"There's an error";
    [alert addButtonWithTitle:@"Go Away"];
    [alert addButtonWithTitle:@"Go Home"];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self loadHomePage];
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loadURLString:textField.text];
    return YES;
}

- (void)loadURLString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)loadHomePage {
   [self loadURLString:@"http://mobilemakers.co"];
}

@end
