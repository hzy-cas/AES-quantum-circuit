// Copyright (c) Microsoft Corporation.
// Licensed under the MIT license.
// 
// S-box circuit based on 
//https://www.nist.gov/publications/depth-16-circuit-aes-s-box and https://github.com/microsoft/grover-blocks

// Mixcolumn based on the paper: Xiang, Z., Zeng, X., Lin, D., Bao, Z. and Zhang, S.: 
// Optimizing implementations of linear layers. IACR Transactions on Symmetric Cryptology, pp.120-145, 2020.
// https://github.com/xiangzejun/Optimizing_Implementations_of_Linear_Layers.

namespace NewSBoxandMixcolumns
{
    open Microsoft.Quantum.Intrinsic;
    open QUtilities;

    // A T-depth-4(AND-depth-4, Toffoli-depth4) forward circuit of the  AES Sbox 
    //
operation ForwardSBox_Depth4(u: Qubit[], s: Qubit[], t: Qubit[], m: Qubit[], l: Qubit[], costing: Bool) : Unit
    {
        body (...)
        {
           LPXOR(u[0], u[3], t[1-1]);
            LPXOR(u[0], u[5], t[2-1]);
            LPXOR(u[0], u[6], t[3-1]);
            LPXOR(u[3], u[5], t[4-1]);
            LPXOR(u[4], u[6], t[5-1]);
            LPXOR(t[1-1], t[5-1], t[6-1]);
            LPXOR(u[1], u[2], t[7-1]);
            LPXOR(u[7], t[6-1], t[8-1]);
            LPXOR(u[7], t[7-1], t[9-1]);
            LPXOR(t[6-1], t[7-1], t[10-1]);
            LPXOR(u[1], u[5], t[11-1]);
            LPXOR(u[2], u[5], t[12-1]);
            LPXOR(t[3-1], t[4-1], t[13-1]);
            LPXOR(t[6-1], t[11-1], t[14-1]);
            LPXOR(t[5-1], t[11-1], t[15-1]);
            LPXOR(t[5-1], t[12-1], t[16-1]);
            LPXOR(t[9-1], t[16-1], t[17-1]);
            LPXOR(u[3], u[7], t[18-1]);
            LPXOR(t[7-1], t[18-1], t[19-1]);
            LPXOR(t[1-1], t[19-1], t[20-1]);
            LPXOR(u[6], u[7], t[21-1]);
            LPXOR(t[7-1], t[21-1], t[22-1]);
            LPXOR(t[2-1], t[22-1], t[23-1]);
            LPXOR(t[2-1], t[10-1], t[24-1]);
            LPXOR(t[20-1], t[17-1], t[25-1]);
            LPXOR(t[3-1], t[16-1], t[26-1]);
            LPXOR(t[1-1], t[12-1], t[27-1]);

            LPAND(t[13-1], t[6-1], m[1-1], costing);
            LPAND(t[23-1], t[8-1], m[2-1], costing);
            LPXOR(t[14-1], m[1-1], m[3-1]);
            LPAND(t[19-1], u[7], m[4-1], costing);
            LPXOR(m[4-1], m[1-1], m[5-1]);
            LPAND(t[3-1], t[16-1], m[6-1], costing);
            LPAND(t[22-1], t[9-1], m[7-1], costing);
            LPXOR(t[26-1], m[6-1], m[8-1]);
            LPAND(t[20-1], t[17-1], m[9-1], costing);
            LPXOR(m[9-1], m[6-1], m[10-1]);
            LPAND(t[1-1], t[15-1], m[11-1], costing);
            LPAND(t[4-1], t[27-1], m[12-1], costing);
            LPXOR(m[12-1], m[11-1], m[13-1]);
            LPAND(t[2-1], t[10-1], m[14-1], costing);
            LPXOR(m[14-1], m[11-1], m[15-1]);
            LPXOR(m[3-1], m[2-1], m[16-1]);
            LPXOR(m[5-1], t[24-1], m[17-1]);
            LPXOR(m[8-1], m[7-1], m[18-1]);
            LPXOR(m[10-1], m[15-1], m[19-1]);
            LPXOR(m[16-1], m[13-1], m[20-1]);
            LPXOR(m[17-1], m[15-1], m[21-1]);
            LPXOR(m[18-1], m[13-1], m[22-1]);
            LPXOR(m[19-1], t[25-1], m[23-1]);
            LPXOR(m[22-1], m[23-1], m[24-1]);
           
            CNOT(m[22-1], l[0]);
            CNOT(m[20-1], l[1]);
           
            LPAND(m[22-1], m[20-1], m[25-1], costing);
            LPAND(l[1], m[23-1], m[31-1], costing);
            LPAND(m[21-1], l[0], m[34-1], costing);

            CNOT(m[24-1], l[3]);
            LPXOR(m[21-1], m[25-1], m[26-1]);
            LPXOR(m[20-1], m[21-1], m[27-1]);
            CNOT(m[27-1], l[2]);
            
           
            LPXOR(m[23-1], m[25-1], m[28-1]);
            LPXOR(m[27-1], m[25-1], m[33-1]);
           
            LPAND(m[28-1], m[27-1], m[29-1], costing);
            LPAND(m[26-1], m[24-1], m[30-1], costing);    
            LPAND(l[2], m[31-1], m[32-1], costing);
            LPAND(l[3], m[34-1], m[35-1], costing);
       

            LPXOR(m[24-1], m[25-1], m[36-1]);
            LPXOR(m[21-1], m[29-1], m[37-1]);
            LPXOR(m[32-1], m[33-1], m[38-1]);
            LPXOR(m[23-1], m[30-1], m[39-1]);
            LPXOR(m[35-1], m[36-1], m[40-1]);
            LPXOR(m[38-1], m[40-1], m[41-1]);
            LPXOR(m[37-1], m[39-1], m[42-1]);
            LPXOR(m[37-1], m[38-1], m[43-1]);
            LPXOR(m[39-1], m[40-1], m[44-1]);
            LPXOR(m[42-1], m[41-1], m[45-1]);

            CNOT(m[44-1], l[4]);
            CNOT(m[40-1], l[5]);
            CNOT(m[39-1], l[6]);
            CNOT(m[43-1], l[7]);
            CNOT(m[38-1], l[8]);
            CNOT(m[37-1], l[9]);
            CNOT(m[42-1], l[10]);
            CNOT(m[45-1], l[11]);
            CNOT(m[41-1], l[12]);



            LPAND(m[44-1], t[6-1], m[46-1], costing);
            LPAND(m[40-1], t[8-1], m[47-1], costing);
            LPAND(m[39-1], u[7], m[48-1], costing);
            LPAND(m[43-1], t[16-1], m[49-1], costing);
            LPAND(m[38-1], t[9-1], m[50-1], costing);
            LPAND(m[37-1], t[17-1], m[51-1], costing);
            LPAND(m[42-1], t[15-1], m[52-1], costing);
            LPAND(m[45-1], t[27-1], m[53-1], costing);
            LPAND(m[41-1], t[10-1], m[54-1], costing);


            LPAND(l[4], t[13-1], m[55-1], costing);
            LPAND(l[5], t[23-1], m[56-1], costing);
            LPAND(l[6], t[19-1], m[57-1], costing);
            LPAND(l[7], t[3-1], m[58-1], costing);
            LPAND(l[8], t[22-1], m[59-1], costing);
            LPAND(l[9], t[20-1], m[60-1], costing);
            LPAND(l[10], t[1-1], m[61-1], costing);
            LPAND(l[11], t[4-1], m[62-1], costing);
            LPAND(l[12], t[2-1], m[63-1], costing);

            CNOT(m[22-1], l[0]);
            CNOT(m[20-1], l[1]);
            CNOT(m[27-1], l[2]);
            CNOT(m[24-1], l[3]);
            CNOT(m[44-1], l[4]);
            CNOT(m[40-1], l[5]);
            CNOT(m[39-1], l[6]);
            CNOT(m[43-1], l[7]);
            CNOT(m[38-1], l[8]);
            CNOT(m[37-1], l[9]);
            CNOT(m[42-1], l[10]);
            CNOT(m[45-1], l[11]);
            CNOT(m[41-1], l[12]);



            LPXOR(m[61-1], m[62-1], l[0]);
            LPXOR(m[50-1], m[56-1], l[1]);
            LPXOR(m[46-1], m[48-1], l[2]);
            LPXOR(m[47-1], m[55-1], l[3]);
            LPXOR(m[54-1], m[58-1], l[4]);
            LPXOR(m[49-1], m[61-1], l[5]);
            LPXOR(m[62-1], l[5], l[6]);
            LPXOR(m[46-1], l[3], l[7]);
            LPXOR(m[51-1], m[59-1], l[8]);
            LPXOR(m[52-1], m[53-1], l[9]);
            LPXOR(m[53-1], l[4], l[10]);
            LPXOR(m[60-1], l[2], l[11]);
            LPXOR(m[48-1], m[51-1], l[12]);
            LPXOR(m[50-1], l[0], l[13]);
            LPXOR(m[52-1], m[61-1], l[14]);
            LPXOR(m[55-1], l[1], l[15]);
            LPXOR(m[56-1], l[0], l[16]);
            LPXOR(m[57-1], l[1], l[17]);
            LPXOR(m[58-1], l[8], l[18]);
            LPXOR(m[63-1], l[4], l[19]);
            LPXOR(l[0], l[1], l[20]);
            LPXOR(l[1], l[7], l[21]);
            LPXOR(l[3], l[12], l[22]);
            LPXOR(l[18], l[2], l[23]);
            LPXOR(l[15], l[9], l[24]);
            LPXOR(l[6], l[10], l[25]);
            LPXOR(l[7], l[9], l[26]);
            LPXOR(l[8], l[10], l[27]);
            LPXOR(l[11], l[14], l[28]);
            LPXOR(l[11], l[17], l[29]);
        }
        adjoint auto;
    }

    operation ForwardSBox_Depth3(u: Qubit[], s: Qubit[], t: Qubit[], m: Qubit[], n: Qubit[], w: Qubit[], l: Qubit[], costing: Bool) : Unit
    {
        body (...)
        {
            //************Layer 1************

            LPXOR(u[ 0  ], u[ 3  ], t[ 1-1]);
            LPXOR(u[ 0  ], u[ 5  ], t[ 2-1]);
            LPXOR(u[ 0  ], u[ 6  ], t[ 3-1]);
            LPXOR(u[ 3  ], u[ 5  ], t[ 4-1]);
            LPXOR(u[ 4  ], u[ 6  ], t[ 5-1]);
            LPXOR(t[ 1-1], t[ 5-1], t[ 6-1]);
            LPXOR(u[ 1  ], u[ 2  ], t[ 7-1]);
            LPXOR(u[ 7  ], t[ 6-1], t[ 8-1]);
            LPXOR(u[ 7  ], t[ 7-1], t[ 9-1]);
            LPXOR(t[ 6-1], t[ 7-1], t[10-1]);
            LPXOR(u[ 1  ], u[ 5  ], t[11-1]);
            LPXOR(u[ 2  ], u[ 5  ], t[12-1]);
            LPXOR(t[ 3-1], t[ 4-1], t[13-1]);
            LPXOR(t[ 6-1], t[11-1], t[14-1]);
            LPXOR(t[ 5-1], t[11-1], t[15-1]);
            LPXOR(t[ 5-1], t[12-1], t[16-1]);
            LPXOR(t[ 9-1], t[16-1], t[17-1]);
            LPXOR(u[ 3  ], u[ 7  ], t[18-1]);
            LPXOR(t[ 7-1], t[18-1], t[19-1]);
            LPXOR(t[ 1-1], t[19-1], t[20-1]);
            LPXOR(u[ 6  ], u[ 7  ], t[21-1]);
            LPXOR(t[ 7-1], t[21-1], t[22-1]);
            LPXOR(t[ 2-1], t[22-1], t[23-1]);
            LPXOR(t[ 2-1], t[10-1], t[24-1]);
            LPXOR(t[20-1], t[17-1], t[25-1]);
            LPXOR(t[ 3-1], t[16-1], t[26-1]);
            LPXOR(t[ 1-1], t[12-1], t[27-1]);

            LPAND(t[13-1], t[ 6-1], m[ 1-1], costing);
            LPAND(t[23-1], t[ 8-1], m[ 2-1], costing);
            LPXOR(t[14-1], m[ 1-1], m[ 3-1]);
            LPAND(t[19-1], u[ 7  ], m[ 4-1], costing);
            LPXOR(m[ 4-1], m[ 1-1], m[ 5-1]);
            LPAND(t[ 3-1], t[16-1], m[ 6-1], costing);
            LPAND(t[22-1], t[ 9-1], m[ 7-1], costing);
            LPXOR(t[26-1], m[ 6-1], m[ 8-1]);
            LPAND(t[20-1], t[17-1], m[ 9-1], costing);
            LPXOR(m[ 9-1], m[ 6-1], m[10-1]);
            LPAND(t[ 1-1], t[15-1], m[11-1], costing);
            LPAND(t[ 4-1], t[27-1], m[12-1], costing);
            LPXOR(m[12-1], m[11-1], m[13-1]);
            LPAND(t[ 2-1], t[10-1], m[14-1], costing);
            LPXOR(m[14-1], m[11-1], m[15-1]);
            LPXOR(m[ 3-1], m[ 2-1], m[16-1]);
            LPXOR(m[ 5-1], t[24-1], m[17-1]);
            LPXOR(m[ 8-1], m[ 7-1], m[18-1]);
            LPXOR(m[10-1], m[15-1], m[19-1]);
            LPXOR(m[16-1], m[13-1], m[20-1]);
            LPXOR(m[17-1], m[15-1], m[21-1]);
            LPXOR(m[18-1], m[13-1], m[22-1]);
            LPXOR(m[19-1], t[25-1], m[23-1]);
            LPXOR(m[22-1], m[23-1], m[24-1]);




            
            //*************Layer 2*********************

       

            // 41 CNOT gates  & 2 XOR gates

            CNOT(u[ 7  ], m[33-1]);
            CNOT(t[ 1-1], m[34-1]);
            CNOT(t[ 1-1], m[35-1]);
            CNOT(t[ 2-1], m[36-1]);
            CNOT(t[ 4-1], m[37-1]);
            CNOT(t[10-1], m[38-1]);
            CNOT(t[15-1], m[39-1]);
            CNOT(t[15-1], m[40-1]);
            LPXOR(m[20-1], m[21-1], m[27-1]);
            CNOT(t[17-1], m[41-1]);
            CNOT(t[19-1], m[42-1]);
            CNOT(t[20-1], m[43-1]);
            CNOT(t[27-1], m[44-1]);
            CNOT(m[20-1], m[45-1]);
            CNOT(m[21-1], m[46-1]);
            CNOT(m[21-1], m[47-1]);
            CNOT(m[22-1], m[48-1]);
            CNOT(m[23-1], m[49-1]);
            CNOT(m[23-1], m[50-1]);
            
            CNOT(m[24-1], l[ 1-1]);

            

            CNOT(m[24-1], l[ 2-1]);

            LPXOR(m[21-1], m[23-1], n[15-1]);  

            CNOT(m[24-1], l[ 3-1]);
            CNOT(l[ 1-1], l[ 4-1]);
            CNOT(l[ 2-1], l[ 5-1]);
            CNOT(m[24-1], l[ 6-1]);
            CNOT(l[ 1-1], l[ 7-1]);
            CNOT(l[ 2-1], l[ 8-1]);
            CNOT(l[ 3-1], l[ 9-1]);
            CNOT(l[ 4-1], l[10-1]);
            CNOT(l[ 5-1], l[11-1]);

            CNOT(m[27-1], l[12-1]);
            CNOT(m[27-1], l[13-1]);
            CNOT(m[27-1], l[14-1]);
            CNOT(l[12-1], l[15-1]);
            CNOT(l[13-1], l[16-1]);
            CNOT(m[27-1], l[17-1]);
            CNOT(l[12-1], l[18-1]);
            CNOT(l[13-1], l[19-1]);
            CNOT(l[14-1], l[20-1]);
            CNOT(l[15-1], l[21-1]);
            CNOT(l[16-1], l[22-1]);
  
            CNOT(n[15-1], l[23-1]);

///////////////////////////////////////////////

          
          
            LPAND(m[22-1], m[20-1], m[25-1], costing);


            LPXOR(m[23-1], m[25-1], m[28-1]);
            
            LPXOR(m[21-1], m[25-1], m[26-1]);

            LPAND(m[45-1], m[23-1], m[29-1], costing);
            LPXOR(m[27-1], m[25-1], m[30-1]);
            
            LPAND(m[21-1], m[48-1], m[31-1], costing);
            LPXOR(m[24-1], m[25-1], m[32-1]);
           
         //   LPAND(m[28-1], m[27-1], m[29-1], costing);
         //   LPAND(m[26-1], m[24-1], m[30-1], costing);    
         //   LPAND(l[2], m[29-1], m[32-1], costing);
         //   LPAND(l[3], m[31-1], m[35-1], costing);

      
            LPAND(m[24-1], t[ 6-1], n[ 1-1], costing); //2
            LPXOR(m[23-1], m[32-1], n[ 2-1]); 
            LPXOR(m[26-1], m[31-1], n[ 3-1]);

            LPAND(l[ 1-1], t[ 8-1], n[ 4-1], costing);  //2

            LPAND(l[ 2-1], u[ 7  ], n[ 6-1], costing);  //2
            LPAND(m[49-1], m[33-1], n[ 7-1], costing);  //2


            LPXOR(m[21-1], m[30-1], n[ 8-1]);
            LPXOR(m[28-1], m[29-1], n[ 9-1]);
            LPAND(m[27-1], t[16-1], n[10-1], costing);  //2


            LPAND(l[12-1], t[ 9-1], n[11-1], costing);  //2


            LPAND(m[46-1], t[17-1], n[13-1], costing);   //2
            LPAND(l[13-1], m[41-1], n[14-1], costing);   //2


//****************************
            


            LPAND(l[14-1], t[15-1], n[16-1], costing);  //2
            LPAND(l[ 3-1], m[39-1], n[17-1], costing);  //2
            LPAND(n[15-1], m[40-1], w[ 9-1], costing);   // 2

            LPXOR(m[30-1], m[32-1], n[18-1]);
            LPXOR(n[15-1], n[18-1], n[19-1]);
            LPXOR(m[28-1], m[29-1], n[20-1]);
            LPXOR(m[26-1], m[31-1], n[21-1]);
            LPAND(l[15-1], t[27-1], n[22-1], costing);  //2
            LPAND(l[ 4-1], m[44-1], n[23-1], costing);  //2


            LPAND(l[16-1], t[10-1], n[24-1], costing);  //2
            LPAND(l[ 5-1], m[38-1], n[25-1], costing);  //2


            LPAND(l[ 6-1], t[13-1], n[26-1], costing);  //2


            LPAND(l[ 7-1], t[23-1], n[27-1], costing);  //2

            LPAND(l[ 8-1], t[19-1], n[29-1], costing);  //2
            LPAND(m[50-1], m[42-1], n[30-1], costing);  //2



            LPAND(l[17-1], t[ 3-1], n[31-1], costing);   //2

            LPAND(l[18-1], t[22-1], n[32-1], costing);  //2


            LPAND(m[47-1], t[20-1], n[34-1], costing);  //2
            LPAND(l[19-1], m[43-1], n[35-1], costing);  //2

            LPAND(l[20-1], t[ 1-1], n[36-1], costing);  //2
            LPAND(l[ 9-1], m[34-1], n[37-1], costing);  //2
            LPAND(l[23-1], m[35-1], w[26-1], costing);   // 2


            LPAND(l[21-1], t[ 4-1], n[38-1], costing);  //2
            LPAND(l[10-1], m[37-1], n[39-1], costing);  //2

            LPAND(l[22-1], t[ 2-1], n[40-1], costing);  //2
            LPAND(l[11-1], m[36-1], n[41-1], costing);  //2



            // Clean the idle qubits used as ancillias
            CNOT(n[15-1], l[23-1]);
            CNOT(l[16-1], l[22-1]);
            CNOT(l[15-1], l[21-1]);
            CNOT(l[14-1], l[20-1]);
            CNOT(l[13-1], l[19-1]);
            CNOT(l[12-1], l[18-1]);
            CNOT(m[27-1], l[17-1]);        
            CNOT(l[13-1], l[16-1]);
            CNOT(l[12-1], l[15-1]);
            CNOT(m[27-1], l[14-1]);
            CNOT(m[27-1], l[13-1]);
            CNOT(m[27-1], l[12-1]);
            CNOT(l[ 5-1], l[11-1]);
            CNOT(l[ 4-1], l[10-1]);
            CNOT(l[ 3-1], l[ 9-1]);
            CNOT(l[ 2-1], l[ 8-1]); 
            CNOT(l[ 1-1], l[ 7-1]);          
            CNOT(m[24-1], l[ 6-1]);
            CNOT(l[ 2-1], l[ 5-1]);
            CNOT(l[ 1-1], l[ 4-1]);
            CNOT(m[24-1], l[ 3-1]);
            CNOT(m[24-1], l[ 2-1]);
            CNOT(m[24-1], l[ 1-1]);
             
            CNOT(m[23-1], m[50-1]);
            CNOT(m[23-1], m[49-1]);  
            CNOT(m[22-1], m[48-1]);
            CNOT(m[21-1], m[47-1]);  
            CNOT(m[21-1], m[46-1]);     
            CNOT(m[20-1], m[45-1]);        
            CNOT(t[27-1], m[44-1]);     
            CNOT(t[20-1], m[43-1]);     
            CNOT(t[19-1], m[42-1]);      
            CNOT(t[17-1], m[41-1]);      
            CNOT(t[15-1], m[40-1]);         
            CNOT(t[15-1], m[39-1]);
            CNOT(t[10-1], m[38-1]);
            CNOT(t[ 4-1], m[37-1]);
            CNOT(t[ 2-1], m[36-1]);
            CNOT(t[ 1-1], m[35-1]);
            CNOT(t[ 1-1], m[34-1]);
            CNOT(u[ 7  ], m[33-1]);

           

           //***************Layer 3********************


            CNOT(m[26-1], l[ 1-1]);
            CNOT(m[26-1], l[ 2-1]);
            CNOT(m[26-1], l[ 3-1]);
            
            CNOT(m[28-1], l[ 4-1]);
            CNOT(m[28-1], l[ 5-1]);
            CNOT(m[28-1], l[ 6-1]);


            CNOT(m[29-1], l[ 7-1]);
            CNOT(m[29-1], l[ 8-1]);
            CNOT(m[29-1], l[ 9-1]);

            CNOT(m[30-1], l[10-1]);

            CNOT(m[31-1], l[11-1]);
            CNOT(m[31-1], l[12-1]);
            CNOT(m[31-1], l[13-1]);

            CNOT(m[32-1], l[14-1]);
            CNOT(n[ 2-1], l[15-1]);
            CNOT(n[ 3-1], l[16-1]);
            CNOT(n[ 8-1], l[17-1]);
            CNOT(n[ 9-1], l[18-1]);

            CNOT(n[18-1], l[19-1]);
            CNOT(n[19-1], l[20-1]);
            CNOT(n[20-1], l[21-1]);
            CNOT(n[21-1], l[22-1]);



            LPAND(n[ 3-1], n[ 1-1], w[ 1-1], costing);  //3 
            LPAND(n[ 2-1], t[ 6-1], w[ 2-1], costing);  //3 
            LPXOR(w[ 1-1], w[ 2-1], m[33-1]);




            LPAND(m[32-1], t[ 8-1], n[ 5-1], costing);  //3 
            LPAND(n[ 4-1], m[31-1], w[ 3-1], costing);  //3
            LPXOR(w[ 3-1], n[ 5-1], m[34-1]);


            LPAND(n[ 6-1], m[26-1], w[ 4-1], costing);  //3
            LPXOR(w[ 4-1], n[ 7-1], m[35-1]);


            LPAND(n[ 8-1], t[16-1], w[ 5-1], costing);   //3
            LPAND(n[ 9-1], n[10-1], w[ 6-1], costing);   //3
            LPXOR(w[ 5-1], w[ 6-1], m[36-1]);



            LPAND(m[30-1], t[ 9-1], n[12-1], costing);  //3
            LPAND(m[29-1], n[11-1], w[ 7-1], costing);  //3
            LPXOR(w[ 7-1], n[12-1], m[37-1]);


            LPAND(m[28-1], n[14-1], w[ 8-1], costing);   //3
            LPXOR(w[ 8-1], n[13-1], m[38-1]);



            LPAND(n[16-1], l[ 4-1], w[10-1], costing);  //3
            LPAND(n[17-1], l[ 1-1], w[11-1], costing);  //3
            LPXOR(w[ 9-1], w[10-1], m[39-1]);
            CNOT(w[11-1], m[39-1]);



            LPAND(n[19-1], t[27-1], w[12-1], costing);  //3
            LPAND(n[20-1], n[22-1], w[13-1], costing);  //3
            LPAND(n[21-1], n[23-1], w[14-1], costing);  //3
            LPXOR(w[12-1], w[13-1], m[40-1]);
            CNOT(w[14-1], m[40-1]); 



            LPAND(l[ 7-1], n[24-1], w[15-1], costing);  //3
            LPAND(n[18-1], t[10-1], w[16-1], costing);  //3
            LPAND(l[11-1], n[25-1], w[17-1], costing);  //3
            LPXOR(w[15-1], w[16-1], m[41-1]);
            CNOT(w[17-1], m[41-1]);


            LPAND(l[16-1], n[26-1], w[18-1], costing);  //3
            LPAND(l[15-1], t[13-1], w[19-1], costing);   //3
            LPXOR(w[18-1], w[19-1], m[42-1]);


            LPAND(l[14-1], t[23-1], n[28-1], costing);  //3
            LPAND(n[27-1], l[12-1], w[20-1], costing);  //3
            LPXOR(w[20-1], n[28-1], m[43-1]);


            LPAND(n[29-1], l[ 2-1], w[21-1], costing);  //3
            LPXOR(w[21-1], n[30-1], m[44-1]);


            LPAND(l[17-1], t[ 3-1], w[22-1], costing);    //3
            LPAND(l[18-1], n[31-1], w[23-1], costing);   //3
            LPXOR(w[22-1], w[23-1], m[45-1]);


            LPAND(l[10-1], t[22-1], n[33-1], costing);  //3
            LPAND(l[ 8-1], n[32-1], w[24-1], costing);  //3
            LPXOR(w[24-1], n[33-1], m[46-1]);


            LPAND(l[ 5-1], n[35-1], w[25-1], costing);  //3
            LPXOR(w[25-1], n[34-1], m[47-1]);


            LPAND(n[36-1], l[ 6-1], w[27-1], costing); //3
            LPAND(n[37-1], l[ 3-1], w[28-1], costing); //3

            LPXOR(w[26-1], w[27-1], m[48-1]);
            CNOT(w[28-1], m[48-1]);



            LPAND(l[20-1], t[ 4-1], w[29-1], costing);  //3
            LPAND(l[21-1], n[38-1], w[30-1], costing); //3
            LPAND(l[22-1], n[39-1], w[31-1], costing); //3
            LPXOR(w[29-1], w[30-1], m[49-1]);
            CNOT(w[31-1], m[49-1]); 



            LPAND(l[ 9-1], n[40-1], w[32-1], costing);  //3
            LPAND(l[19-1], t[ 2-1], w[33-1], costing);  //3
            LPAND(l[13-1], n[41-1], w[34-1], costing);  //3
            LPXOR(w[32-1], w[33-1], m[50-1]);
            CNOT(w[34-1], m[50-1]);


            CNOT(m[26-1], l[ 1-1]);
            CNOT(m[26-1], l[ 2-1]);
            CNOT(m[26-1], l[ 3-1]);
            
            CNOT(m[28-1], l[ 4-1]);
            CNOT(m[28-1], l[ 5-1]);
            CNOT(m[28-1], l[ 6-1]);


            CNOT(m[29-1], l[ 7-1]);
            CNOT(m[29-1], l[ 8-1]);
            CNOT(m[29-1], l[ 9-1]);

            CNOT(m[30-1], l[10-1]);

            CNOT(m[31-1], l[11-1]);
            CNOT(m[31-1], l[12-1]);
            CNOT(m[31-1], l[13-1]);

            CNOT(m[32-1], l[14-1]);
            CNOT(n[ 2-1], l[15-1]);
            CNOT(n[ 3-1], l[16-1]);
            CNOT(n[ 8-1], l[17-1]);
            CNOT(n[ 9-1], l[18-1]);

            CNOT(n[18-1], l[19-1]);
            CNOT(n[19-1], l[20-1]);
            CNOT(n[20-1], l[21-1]);
            CNOT(n[21-1], l[22-1]);





            LPXOR(m[48-1], m[49-1], l[0]);
            LPXOR(m[37-1], m[43-1], l[1]);
            LPXOR(m[33-1], m[35-1], l[2]);
            LPXOR(m[34-1], m[42-1], l[3]);
            LPXOR(m[41-1], m[45-1], l[4]);
            LPXOR(m[36-1], m[48-1], l[5]);
            LPXOR(m[49-1], l[5], l[6]);
            LPXOR(m[33-1], l[3], l[7]);
            LPXOR(m[38-1], m[46-1], l[8]);
            LPXOR(m[39-1], m[40-1], l[9]);
            LPXOR(m[40-1], l[4], l[10]);
            LPXOR(m[47-1], l[2], l[11]);
            LPXOR(m[35-1], m[38-1], l[12]);
            LPXOR(m[37-1], l[0], l[13]);
            LPXOR(m[39-1], m[48-1], l[14]);
            LPXOR(m[42-1], l[1], l[15]);
            LPXOR(m[43-1], l[0], l[16]);
            LPXOR(m[44-1], l[1], l[17]);
            LPXOR(m[45-1], l[8], l[18]);
            LPXOR(m[50-1], l[4], l[19]);
            LPXOR(l[0], l[1], l[20]);
            LPXOR(l[1], l[7], l[21]);
            LPXOR(l[3], l[12], l[22]);
            LPXOR(l[18], l[2], l[23]);
            LPXOR(l[15], l[9], l[24]);
            LPXOR(l[6], l[10], l[25]);
            LPXOR(l[7], l[9], l[26]);
            LPXOR(l[8], l[10], l[27]);
            LPXOR(l[11], l[14], l[28]);
            LPXOR(l[11], l[17], l[29]);

        }
        
        adjoint auto;
    }

    operation SBox_Depth4 (input: Qubit[], output: Qubit[], costing: Bool) : Unit
    {
        body (...)
        {
            using ((t, m, l) = (Qubit[27], Qubit[63], Qubit[30]))
            {
                let u = input[7..(-1)..0];
                let s = output[7..(-1)..0];

                ForwardSBox_Depth4(u, s, t, m, l, costing);
                // get out result
              
                LPXOR(l[6], l[24], s[0]);
                LPXNOR(l[16], l[26], s[1]);
                LPXNOR(l[19], l[28], s[2]);
                LPXOR(l[6], l[21], s[3]);
                LPXOR(l[20], l[22], s[4]);
                LPXOR(l[25], l[29], s[5]);
                LPXNOR(l[13], l[27], s[6]);
                LPXNOR(l[6], l[23], s[7]);
                // uncompute
                (Adjoint ForwardSBox_Depth4)(u, s, t, m, l, costing);
             
            }
        }
        adjoint auto;
    }


   operation SBox_Depth3 (input: Qubit[], output: Qubit[], costing: Bool) : Unit
    {
        body (...)
        {
            using ((t, m, n, w, l) = (Qubit[27], Qubit[50], Qubit[41], Qubit[34], Qubit[30]))  
            {
                let u = input[7..(-1)..0];
                let s = output[7..(-1)..0];

                ForwardSBox_Depth3(u, s, t, m, n, w,  l, costing);


                // get out result
        
   
                LPXOR(l[6], l[24], s[0]);
                LPXNOR(l[16], l[26], s[1]);
                LPXNOR(l[19], l[28], s[2]);
                LPXOR(l[6], l[21], s[3]);
                LPXOR(l[20], l[22], s[4]);
                LPXOR(l[25], l[29], s[5]);
                LPXNOR(l[13], l[27], s[6]);
                LPXNOR(l[6], l[23], s[7]);
    
                // uncompute
                 (Adjoint ForwardSBox_Depth3)(u, s, t, m, n, w, l, costing);
             
            }
        }
        adjoint auto;
    }
// Mixcolumns on one column with  92 CNOT gates

 operation MixWord(word: Qubit[], costing: Bool) : Unit  
    {
        body (...)
        {
            // U
           
           CNOT(word[31]  , word[23] );       
            CNOT(word[15]  , word[31] );       
            CNOT(word[ 4]  , word[12] );       
            CNOT(word[21]  , word[13] );       
            CNOT(word[ 9]  , word[17] );       
            CNOT(word[27]  , word[11] );       
            CNOT(word[28]  , word[ 4] );       
            CNOT(word[ 5]  , word[21] );       
            CNOT(word[24]  , word[ 0] );       
            CNOT(word[ 7]  , word[15] );       
            CNOT(word[ 1]  , word[ 9] );       
            CNOT(word[ 6]  , word[14] );       
            CNOT(word[16]  , word[24] );       
            CNOT(word[22]  , word[ 6] );       
            CNOT(word[31]  , word[16] );       
            CNOT(word[ 8]  , word[24] );       
            CNOT(word[26]  , word[18] );       
            CNOT(word[30]  , word[22] );       
            CNOT(word[10]  , word[26] );       
            CNOT(word[23]  , word[ 8] );       
            CNOT(word[13]  , word[30] );       
            CNOT(word[29]  , word[13] );       
            CNOT(word[13]  , word[ 5] );       
            CNOT(word[ 4]  , word[29] );       
            CNOT(word[11]  , word[ 4] );       
            CNOT(word[19]  , word[11] );       
            CNOT(word[12]  , word[13] );       
            CNOT(word[23]  , word[19] );       
            CNOT(word[31]  , word[ 4] );       
            CNOT(word[20]  , word[12] );       
            CNOT(word[12]  , word[28] );       
            CNOT(word[27]  , word[20] );       
            CNOT(word[19]  , word[20] );       
            CNOT(word[31]  , word[27] );       
            CNOT(word[15]  , word[12] );       
            CNOT(word[ 3]  , word[27] );       
            CNOT(word[11]  , word[ 3] );       
            CNOT(word[ 2]  , word[11] );       
            CNOT(word[18]  , word[19] );       
            CNOT(word[10]  , word[11] );       
            CNOT(word[18]  , word[10] );       
            CNOT(word[ 2]  , word[18] );       
            CNOT(word[ 9]  , word[10] );       
            CNOT(word[ 9]  , word[ 2] );       
            CNOT(word[17]  , word[18] );       
            CNOT(word[25]  , word[17] );       
            CNOT(word[17]  , word[ 1] );       
            CNOT(word[24]  , word[25] );       
            CNOT(word[ 8]  , word[ 9] );       
            CNOT(word[15]  , word[24] );       
            CNOT(word[15]  , word[11] );       
            CNOT(word[ 0]  , word[ 8] );       
            CNOT(word[23]  , word[15] );       
            CNOT(word[16]  , word[17] );       
            CNOT(word[ 0]  , word[16] );       
            CNOT(word[31]  , word[ 0] );       
            CNOT(word[23]  , word[16] );       
            CNOT(word[ 6]  , word[23] );       
            CNOT(word[ 7]  , word[31] );       
            CNOT(word[22]  , word[31] );       
            CNOT(word[ 6]  , word[30] );       
            CNOT(word[14]  , word[ 7] );       
            CNOT(word[21]  , word[14] );       
            CNOT(word[ 5]  , word[ 6] );       
            CNOT(word[21]  , word[22] );       
            CNOT(word[29]  , word[ 5] );       
            CNOT(word[28]  , word[21] );       
            CNOT(word[21]  , word[29] );       
            CNOT(word[13]  , word[21] );       
            CNOT(word[27]  , word[12] );       
            CNOT(word[26]  , word[27] );       
            CNOT(word[20]  , word[28] );       
            CNOT(word[ 4]  , word[20] );       
            CNOT(word[ 1]  , word[26] );       
            CNOT(word[30]  , word[14] );       
            CNOT(word[12]  , word[ 4] );       
            CNOT(word[19]  , word[ 3] );       
            CNOT(word[27]  , word[19] );       
            CNOT(word[25]  , word[ 1] );       
            CNOT(word[24]  , word[ 0] );       
            CNOT(word[ 0]  , word[ 1] );       
            CNOT(word[26]  , word[ 2] );       
            CNOT(word[ 9]  , word[25] );       
            CNOT(word[ 7]  , word[15] );       
            CNOT(word[23]  , word[ 7] );       
            CNOT(word[14]  , word[ 6] );       
            CNOT(word[17]  , word[ 9] );       
            CNOT(word[31]  , word[23] );       
            CNOT(word[18]  , word[26] );       
            CNOT(word[ 6]  , word[22] );       
            CNOT(word[ 0]  , word[17] );       
            CNOT(word[11]  , word[27] );    

         
            REWIRE(word[ 0], word[24], costing);
            REWIRE(word[ 1], word[25], costing);
            REWIRE(word[ 1], word[17], costing);
            REWIRE(word[ 2], word[18], costing);
            REWIRE(word[ 2], word[10], costing);
            REWIRE(word[ 3], word[19], costing);
            REWIRE(word[ 3], word[11], costing);
            REWIRE(word[ 5], word[29], costing);
            REWIRE(word[ 5], word[13], costing);
            REWIRE(word[ 6], word[22], costing);
            REWIRE(word[ 6], word[30], costing);
            REWIRE(word[ 6], word[14], costing);
            REWIRE(word[ 7], word[15], costing);
            REWIRE(word[ 8], word[16], costing);
            REWIRE(word[12], word[28], costing);
            REWIRE(word[12], word[20], costing);
            REWIRE(word[23], word[31], costing);    

        }
        adjoint auto;
    }

    operation MixColumn(state: Qubit[][], costing: Bool) : Unit
    {
        body (...)
        {
            for (j in 0..3)
            {
                MixWord(state[j], costing);
            }
        }
        adjoint auto;
    }
}