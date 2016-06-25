//
//  PostCell.h
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DataService.h"

@interface PostCell : UITableViewCell {
    DataService *myDataService;
}


@property (weak, nonatomic) IBOutlet UIImageView *postImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

-(void) configureCell: (Post *)post;

@end
