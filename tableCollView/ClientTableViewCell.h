//
//  ClientTableViewCell.h
//  Manahej4
//
//  Created by Vamsi on 27/09/16.
//  Copyright © 2016 Semanoor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *btnExpand;
@property (weak, nonatomic) IBOutlet UIView *viewtitle;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;
- (void)setCollectionViewContentOffset: (CGFloat) xContentOffset;
- (CGFloat)getCollectionViewXOffset;

@end
