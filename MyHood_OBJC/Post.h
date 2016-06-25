//
//  Post.h
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding> {
    NSString *imagePath;
    NSString *title;
    NSString *postDesc;
    
}

@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *postDesc;

-(id)initWithImagePath: (NSString *)aImagePath title:(NSString *)aTitle description:(NSString *)aDescription;

@end
