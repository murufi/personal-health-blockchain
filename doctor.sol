pragma solidity >=0.8.22 < 0.9.0;

 /* SPDX-License-Identifier: MIT
  title Medical records
 dev Store & retreive Doctor details 
 */
 
 
contract Doctor {
   
     
      mapping(uint256 => doctor) doctorlist;
    
     struct doctor{
         string doctor_name;
         string doctor_specialisation;
         uint256 doctor_ph_no;
         string doctor_address;
     }
     doctor d;
     
     address owner;
     
        // dev Sets the owner  of the contract to the deployer
      constructor()  {
          owner = //0xA4f0B963Ac27E3F279ba07D93B7A8978e2616A14;
          // 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
          // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
          0xd9145CCE52D386f254917e481eB44e9943F39138;
          // 0xE6005Cc724c2d44F0aF23d663017a7E375DD7F35; //Address of Hospital
      
      }
      
     // dev modifier to give access only to hospital
       modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;

     }
     
     
     
     
     
     
     
     /*
      dev Store doctor details
      param doctor_id doctor id
      param _doctor_name name of doctor
      param _doctor_specialisation specialisation of doctor
      param _doctor_ph_no doctor phone number
      custom:dev-run-script file_path
     */
   function store_doctor_details(uint16 doctor_id,string memory _doctor_name,string memory _doctor_specialisation,uint256 _doctor_ph_no,string memory _doctor_address)public isOwner {
    
         d.doctor_name = _doctor_name;
         d.doctor_specialisation = _doctor_specialisation;
         d.doctor_ph_no = _doctor_ph_no;
         d.doctor_address = _doctor_address;
         
         
        doctorlist[doctor_id] = d;
        
        
   }
         
          /*
      dev Retreive doctor details
      param doctor_id doctor id
      
      */
         function retreive_doctor_details(uint16 doctor_id) public view returns (string memory,string memory,uint256,string memory){
             
     doctor memory dDetails = doctorlist[doctor_id];
     
     return (dDetails.doctor_name,dDetails.doctor_specialisation,dDetails.doctor_ph_no,dDetails.doctor_address);
     
          }
           
              
}