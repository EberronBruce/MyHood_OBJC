//
//  Post.m
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import "Post.h"

@implementation Post

@synthesize imagePath;
@synthesize title;
@synthesize postDesc;




-(id)initWithImagePath: (NSString *)aImagePath title:(NSString *)aTitle description:(NSString *)aDescription{
    self = [super init];
    
    if (self) {
        imagePath = aImagePath;
        title = aTitle;
        postDesc = aDescription;
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    
    self.imagePath = [aDecoder decodeObjectForKey:@"imagePath"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.postDesc = [aDecoder decodeObjectForKey:@"description"];
   
    
    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:(self.imagePath) forKey:@"imagePath"];
    [aCoder encodeObject:(self.postDesc) forKey:@"description"];
    [aCoder encodeObject:(self.title) forKey:@"title"];
    
}

@end
