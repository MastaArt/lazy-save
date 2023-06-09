/ *      
 [ I N F O ]    
 N A M E = L a z y   S a v e  
 V E R S I O N = 1 . 0 . 0  
 A U T H O R = M a s t a M a n  
 D E V = h t t p s : / / 3 d g r o u n d . n e t  
 H E L P =    
 C L I E N T = H I S M  
  
 M A C R O 1 = L a z y S a v e  
 M A C R O 2 = L a z y S a v e A s  
 C A T = [ 3 D G R O U N D ]  
  
 [ A B O U T ]  
 S c r i p t   f o r   l a z y   s a v i n g   s c e n e s   f o r   b u g g y   n e t w o r k s . =  
  
 [ 1 . 0 . 0 ]  
 *   I n i t i a l   r e l e a s e   =  
  
 [ S C R I P T ]  
 * /  
  
 s t r u c t   L a z y S a v e   (  
 	 f n   s a v e   s a v e A s :   f a l s e   =   (  
 	 	 l o c a l   h o l d F i l e   =   ( g e t D i r   # a u t o b a c k )   +   @ " \ m a x h o l d . m x "  
 	 	 l o c a l   f i l e   =   m a x F i l e P a t h   +   m a x F i l e N a m e  
 	 	  
 	 	 i f   ( f i l e . c o u n t   = =   0   o r   s a v e A s )   d o   (  
 	 	 	 f i l e   =   g e t S a v e F i l e N a m e   c a p t i o n :   " S a v e   F i l e   a s   L a z y "   t y p e s :   " 3 d s   M a x   ( * . m a x ) | * . m a x "  
 	 	 	 i f   ( f i l e   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	 	  
 	 	 	 h o l d M a x F i l e ( )  
 	 	 	 r e s e t M a x F i l e   # n o P r o m p t    
 	 	 	 s a v e M a x F i l e   f i l e   q u i e t :   t r u e  
 	 	 	 f e t c h M a x F i l e   q u i e t :   t r u e  
 	 	 )  
 	 	  
 	 	 i f   ( n o t   p a t h C o n f i g . i s U n c P a t h   f i l e )   d o   (  
 	 	 	 p r i n t   " L o c a l   s a v i n g . . . "  
 	 	 	 r e t u r n   s a v e M a x F i l e   f i l e   q u i e t :   t r u e  
 	 	 )  
 	 	  
 	 	 p r i n t   " L a z y   N e t w o r k   S a v i n g . . . "  
 	 	 h o l d M a x F i l e ( )  
 	 	 s e t S a v e R e q u i r e d   f a l s e  
 	 	 l o c a l   h o l d D a t e   =   g e t F i l e M o d D a t e   h o l d F i l e  
 	 	  
 	 	 l o c a l   c m d   =   " c o p y   / y   \ " "   +   h o l d F i l e   +   " \ "   \ " "   +   f i l e   +   " \ " "  
 	 	 H i d d e n D O S C o m m a n d   c m d  
 	 	  
 	 	 l o c a l   f i l e D a t e   =   g e t F i l e M o d D a t e   f i l e  
 	 	  
 	 	 i f   ( h o l d D a t e   ! =   f i l e D a t e )   d o   m e s s a g e B o x   " F i l e   s a v e d   w r o n g !   P l e a s e   t a k e   a t t e n t i o n ! "  
 	 ) ,  
 	  
 	 f n   s a v e A s   =   (  
 	 	 t h i s . s a v e   s a v e A s :   t r u e  
 	 )  
 )  
  
 g l o b a l   L A Z Y _ S A V E   =   L a z y S a v e ( ) 