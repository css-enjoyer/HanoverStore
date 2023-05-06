package Security;


import Security.Security;


public class TestEncryption {
    private static String key2String = "edriechbalajadia";
    private static byte[] key2 = key2String.getBytes();
    private static byte[] key = {'e', 'd', 'r', 'i', 'e', 'c', 'h', 'b', 'a', 'l', 'a', 'j', 'a', 'd', 'i', 'a'};
    
    public static void main(String[] args) {
        String cipher = "AES/ECB/PKCS5Padding";
        String string = new String(key2);
        System.out.println("new string: " + string);
        String str = "encrypt1";
        
        System.out.println("Original Str: " + str);
        
        String encrypStr = Security.encrypt(str, key, cipher);
        String encrypStr2 = Security.encrypt(str, key2, cipher);
        
        System.out.println("Encrypted version: " + encrypStr);
        System.out.println("Encrypted version 2: " + encrypStr2);
        
        System.out.println("encrypted str length: " + encrypStr.length());
        
        System.out.println("Decrypted version: " + Security.decrypt(encrypStr, key, cipher));
    }
}


/*

       private static byte[] key = {'l','a','w','r','e','n','c','e',
                                     'd','e','c','a','m','o','r','a'};

Original Str: university of santo tomas
Encrypted version: +dcrgAbzQxC16Oogbp1W4efGxGjVyfgTWzx/AXWK5Uo=
Decrypted version: university of santo tomas
*/



/*

	private static byte[] key = {
	 	0x74, 0x68, 0x69, 0x73, 0x49, 0x73, 0x41, 0x53, 
                0x65, 0x63, 0x72, 0x65, 0x74, 0x4b, 0x65, 0x79
                 // thisisasecretkey
	};

Original Str: university of santo tomas
Encrypted version: X03O/bZKNujj5EHOnGB41TLCWUWlvxtbMA9dViDNg9o=
Decrypted version: university of santo tomas


*/