//
//  ViewController.m
//  tableCollView
//
//  Created by surendra on 19/06/17.
//  Copyright © 2017 surendra. All rights reserved.
//

#import "ViewController.h"
#import "ClientTableViewCell.h"
#import "ClientCollectionViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _clientTableArray = [[NSMutableArray alloc]initWithObjects:NSLocalizedString(@"EXPLORE", nil), NSLocalizedString(@"FEATURED", nil), NSLocalizedString(@"FAVOURITE", nil),NSLocalizedString(@"RECENT", nil), nil];
    
    _clientTableView.dataSource = self;
    _clientTableView.delegate = self;
    UINib *cellNib = [UINib nibWithNibName:@"ClientTableViewCell" bundle:Nil];
    [self.clientTableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    [_clientTableView reloadData];


    // Do any additional setup after loading the view, typically from a nib.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _clientTableArray.count;
}

-(ClientTableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    ClientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ClientTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.collectionView.tag = indexPath.row;
    cell.lblTitle.text = [_clientTableArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    //Expand functionality:
    return cell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(ClientTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
    
}

#pragma mark - UITableViewDelegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 250;
}



#pragma mark - CollectionView

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return CGSizeMake(150, 172);
    } else {
        return CGSizeMake(84, 96);
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    int _clientLevelID = 0;
    if (_clientLevelID == 0) {
        if (collectionView.tag == 0) {
            return 15;
        } else if (collectionView.tag == 1) {
            return 11;
        } else if (collectionView.tag == 2) {
            return 12;
        } else if (collectionView.tag == 3) {
            return 5;
        }
    }else{
        return 4;
    }
    return 4;
}

-(ClientCollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    ClientCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [[cell.infoButton layer] setValue:[NSNumber numberWithInteger:collectionView.tag] forKey:@"collectionTag"];
    cell.infoButton.tag = indexPath.row;
    [cell.infoButton addTarget:self action:@selector(showClientInfo:) forControlEvents:UIControlEventTouchUpInside];
    //Assign Image and title:
    cell.cellTitle.text = @"surendra";
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSLog(@"Collection view cell selected ");
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    if (selectedCell != nil)
    {
            if (collectionView.tag == 0) {
                
                NSLog(@"Collection view cell 1 selected ");
                NSLog(@"indes %ld ",indexPath.row);

            }else if(collectionView.tag == 1){
                NSLog(@"Collection view cell 1 selected ");
                NSLog(@"indes %ld ",indexPath.row);

                
            }else if(collectionView.tag == 2){
                NSLog(@"Collection view cell 3 selected ");

                NSLog(@"indes %ld ",indexPath.row);

            }else if(collectionView.tag == 3){
                NSLog(@"Collection view cell 4 selected ");
                NSLog(@"indes %ld ",indexPath.row);

                
            }
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
