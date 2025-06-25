namespace HospitalManagement.Models
{
    public class Patients
    {
        public int PatientID { get; set; }
        public string PatientName { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string ContactNumber { get; set; }
        public string EmailAddress { get; set; }
        public string Address { get; set; }
        public DateTime AdmissionDate { get; set; }

        // Foreign Keys
        public int HospitalID { get; set; }
        public int DoctorID { get; set; }

        // Navigation properties
        public HospitalMaster Hospital { get; set; }
        public Doctors Doctor { get; set; }
    }

}
