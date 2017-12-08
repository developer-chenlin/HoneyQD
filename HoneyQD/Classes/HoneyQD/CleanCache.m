//
//  CleanCache.m
//  Expecta
//
//  Created by 陈林 on 2017/12/8.
//

#import "CleanCache.h"

@implementation CleanCache


#pragma mark -
#pragma mark 目录相关
+(NSString *)documentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+(NSString *)libraryPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+(NSString *)tmpPath {
    return   NSTemporaryDirectory();
}


#pragma mark -
#pragma makr 缓存相关
+(NSInteger)sizeWithFilePath:(NSString *)path {
    
    //定义记录大小
    NSInteger totalSize = 0;
    
    //创建一个文件管理器
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //获取目录下的文件所有路径及其子路径
    NSArray *subPaths = [manager subpathsAtPath:path];
    
    //遍历获取文件名称
    for (NSString *fileName in subPaths) {
        //拼接获取完整路径
        NSString *subPath = [path stringByAppendingPathComponent:fileName];
        
        //判断是否是隐藏文件
        if ([fileName hasPrefix:@".DS"]) {
            continue;
        }
        
        //判断是否是文件夹
        BOOL isDirectory;
        [manager fileExistsAtPath:subPath isDirectory:&isDirectory];
        if (isDirectory) {
            continue;
        }
        
        //获取文件属性
        NSDictionary *dict = [manager attributesOfItemAtPath:subPath error:nil];
        
        //累加
        totalSize += [dict fileSize];
    }
    return totalSize;
}

+(NSString *)sizeStrWithFilePath:(NSString *)path {
    float fileSize = (float)[CleanCache sizeWithFilePath:path] ;
    int utitIdx = 0;
    NSArray *unitAry = @[@"B",@"KB",@"MB",@"GB",@"TB"];
    do {
        fileSize /= 1000.0f;
        utitIdx ++;
    } while (fileSize > 1000.0f);
    
    return [NSString stringWithFormat: @"%.2f %@",fileSize,unitAry[utitIdx]];
}



+(NSArray *)getAllFileNames:(NSString *)dirPath {
    NSMutableArray *result = [NSMutableArray array];
    //创建一个文件管理器
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //获取目录下的文件所有路径及其子路径
    NSArray *subPaths = [manager subpathsAtPath:dirPath];
    
    //遍历获取文件名称
    for (NSString *fileName in subPaths) {
        //拼接获取完整路径
        NSString *subPath = [dirPath stringByAppendingPathComponent:fileName];
        
        //判断是否是隐藏文件
        if ([fileName hasPrefix:@".DS"]) {
            continue;
        }
        
        //判断是否是文件夹
        BOOL isDirectory;
        [manager fileExistsAtPath:subPath isDirectory:&isDirectory];
        
        
        if (isDirectory) {
            [result addObject:subPath];
        }
    }
    return  (NSArray *)result;
}

+(BOOL)clearCachesFromDirectoryPath:(NSString *)dirPath {
    //拿到path路径的下一级目录的子文件夹
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
    
    NSString *filePath = nil;
    
    NSError *error = nil;
    
    for (NSString *subPath in subPathArr)
    {
        filePath = [dirPath stringByAppendingPathComponent:subPath];
        
        //删除子文件夹
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    return YES;
}

@end
