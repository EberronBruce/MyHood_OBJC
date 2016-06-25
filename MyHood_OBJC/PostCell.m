//
//  PostCell.m
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    myDataService = [DataService sharedInstance];
    
    _postImg.layer.cornerRadius = _postImg.frame.size.width/2 ;
    _postImg.clipsToBounds = true;
}

-(void) configureCell: (Post *)post {
    _titleLbl.text = post.title;
    _descLbl.text = post.postDesc;
    _postImg.image = [myDataService imageForPath:post.imagePath];
}

@end
