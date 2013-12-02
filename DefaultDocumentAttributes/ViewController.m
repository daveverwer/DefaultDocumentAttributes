#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  NSString *HTMLString = @"<p>Hello, <strong>World</strong>.</p>";
  NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];

  NSError *attributedStringError = nil;
  NSDictionary *documentReturnedAttributes = nil;
  NSDictionary *documentAttributes = @{ NSDefaultAttributesDocumentAttribute : @{ NSFontAttributeName : [UIFont fontWithName:@"MarkerFelt-Wide" size:30], NSForegroundColorAttributeName : [UIColor redColor] } };
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:HTMLData options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSDefaultAttributesDocumentAttribute : documentAttributes } documentAttributes:&documentReturnedAttributes error:&attributedStringError];
  if (attributedString == nil) NSLog(@"%@", attributedStringError);

  // Note: No font or colour attributes in this returned attributes array
  NSLog(@"Returned attributes: %@", documentReturnedAttributes);

  self.label.attributedText = attributedString;
}

@end
