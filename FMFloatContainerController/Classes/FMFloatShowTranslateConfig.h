//
//  FMFloatShowTranslateConfig.h
//  FMFloatContainerController
//
//  Created by iOS on 2022/11/28.
//

#import "FMFloatShowBaseConfig.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FMFloatShowTranslateFrom) {
    FMFloatShowTranslateFromTop,
    FMFloatShowTranslateFromLeft,
    FMFloatShowTranslateFromBottom,
    FMFloatShowTranslateFromRight
};

@interface FMFloatShowTranslateConfig : FMFloatShowBaseConfig

@property(nonatomic, assign)UIEdgeInsets contentInsets;
@property(nonatomic, assign)CGFloat contentSize;
@property(nonatomic, assign)FMFloatShowTranslateFrom from;

@end

NS_ASSUME_NONNULL_END
