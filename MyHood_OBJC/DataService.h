//
//  DataService.h
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

@interface DataService : NSObject

@property (nonatomic, strong) NSMutableArray *loadedPosts;
extern NSString * const KEY_POSTS;

+(id)sharedInstance;
-(void) savePosts;
-(void) loadPosts;
-(NSString *)saveImageAndCreatePath:(UIImage *)image;
-(UIImage *) imageForPath:(NSString *) path;
-(void) addPost:(Post *)post;
-(NSString *)documentsPathForFileName:(NSString *)name;


@end
