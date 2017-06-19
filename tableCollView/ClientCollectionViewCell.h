//
//  ClientCollectionViewCell.h
//  Manahej4
//
//  Created by Vamsi on 27/09/16.
//  Copyright © 2016 Semanoor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *cellimage;
@property (nonatomic, weak) IBOutlet UILabel *cellTitle;
@property (nonatomic, weak) IBOutlet UIButton *infoButton;
@end
