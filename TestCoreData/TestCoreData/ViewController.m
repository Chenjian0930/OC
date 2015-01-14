//
//  ViewController.m
//  TestCoreData
//
//  Created by chen on 15/1/9.
//  Copyright (c) 2015年 chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIManagedDocument *document;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    
    _document = [[UIManagedDocument alloc] initWithFileURL:modelURL];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[modelURL path]]) {
        [_document openWithCompletionHandler:^(BOOL success) {
            if (success) [self documentIsReady];
            if (!success) NSLog(@"couldn’t open document at %@", modelURL);
        }];
    } else {
        [_document saveToURL:modelURL forSaveOperation:UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success) [self documentIsReady];
              if (!success) NSLog(@"couldn’t create document at %@", modelURL);
          }];
    }
    
}

- (void)documentIsReady {
    if (self.document.documentState == UIDocumentStateNormal) {
        NSManagedObjectContext *context = self.document.managedObjectContext;
        // do something with the Core Data context
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
