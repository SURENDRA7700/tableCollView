//
//  ClientTableViewCell.m
//  Manahej4
//
//  Created by Vamsi on 27/09/16.
//  Copyright © 2016 Semanoor. All rights reserved.
//

#import "ClientTableViewCell.h"

@implementation ClientTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UINib *cellNib = [UINib nibWithNibName:@"ClientCollectionViewCell" bundle:Nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];

    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffect = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffect.frame =  _viewtitle.bounds;
    [visualEffect setAlpha:.75];
    [_viewtitle addSubview:visualEffect];
    [_viewtitle sendSubviewToBack:visualEffect];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        [self.lblTitle setFont:[UIFont fontWithName:@"FiraSans-SemiBold" size:12.0]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    self.collectionView.tag = indexPath.row;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        [flowLayout setSectionInset:UIEdgeInsetsMake(16, 32, 16, 16)];
        [flowLayout setMinimumLineSpacing:24];
        [flowLayout setMinimumInteritemSpacing:24];
        [flowLayout setItemSize:CGSizeMake(150, 172)];
    }else{
        
        [flowLayout setSectionInset:UIEdgeInsetsMake(15, 15, 15, 15)];
        [flowLayout setMinimumLineSpacing:24];
        [flowLayout setMinimumInteritemSpacing:24];
        [flowLayout setItemSize:CGSizeMake(120, 180)];
    }
    [self.collectionView reloadData];
}

- (void)setCollectionViewContentOffset: (CGFloat) xContentOffset {
    
    [self.collectionView setContentOffset:CGPointMake(xContentOffset, self.collectionView.contentOffset.y)];
}

- (CGFloat)getCollectionViewXOffset{
    return self.collectionView.contentOffset.x;
}


@end
