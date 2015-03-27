//
//  main.m
//  Ch26Stringz
//
//  Created by Xiao Lu on 3/26/15.
//
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        /* WRITING FILE */
        NSMutableString *strWrite =[[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [strWrite appendString:@"Aaron is cool!\n"];
        }
        
        NSError *error;
        
        BOOL success = [strWrite writeToFile:@"/tmp/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        if (success) {
            NSLog(@"done writing /tmp/cool.txt");
        }
        else {
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
        }
        
        /* READING FILE */
        NSString *strRead = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                              encoding:NSASCIIStringEncoding
                                                 error:&error];
        if (!strWrite) {
            NSLog(@"read failed: %@", [error localizedDescription]);
        }
        else {
            NSLog(@"resolve.conf looks like this: %@", strRead);
        }
    }
    return 0;
}

