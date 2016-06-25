//
//  DataService.m
//  MyHood_OBJC
//
//  Created by Bruce Burgess on 6/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

#import "DataService.h"

@implementation DataService
    
+(id)sharedInstance {
    static dispatch_once_t p = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

-(id)init {
    if(self = [super init]) {
        _loadedPosts = [[NSMutableArray alloc]init];
        [self loadedPosts];
    }
    
    return self;
}

NSString * const KEY_POSTS = @"posts";

-(void) savePosts {
    
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:(_loadedPosts)];
    [[NSUserDefaults standardUserDefaults] setObject:postsData forKey:KEY_POSTS];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) loadPosts {
    
    NSData *postsData =[[NSUserDefaults standardUserDefaults] objectForKey:KEY_POSTS];
    
    if (postsData) {
        
        NSMutableArray<Post *> *postsArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
        
        if (postsArray) {
            _loadedPosts = postsArray;
        }
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postsLoaded" object:nil];
    
}


-(NSString *)saveImageAndCreatePath:(UIImage *)image {

    NSData *imgData  = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", NSDate.timeIntervalSinceReferenceDate];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;

}

-(UIImage *) imageForPath:(NSString *) path {
    NSString *fullpath = [self documentsPathForFileName:path];
    UIImage *image = [UIImage imageNamed:fullpath];
    return image;
}



-(void) addPost:(Post *)post {
    
    [_loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
    
}


-(NSString *)documentsPathForFileName:(NSString *)name {
    
    NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = [paths objectAtIndex:0];
    return [fullPath stringByAppendingString:name];
    
}




@end
