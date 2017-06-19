//
//  ViewController.h
//  tableCollView
//
//  Created by surendra on 19/06/17.
//  Copyright © 2017 surendra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic, strong) NSMutableArray *clientTableArray;
@property (weak, nonatomic) IBOutlet UITableView *clientTableView;


@end

