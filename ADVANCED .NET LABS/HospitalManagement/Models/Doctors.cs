namespace HospitalManagement.Models
{
    public class Doctors
    {
        public int DoctorID { get; set; }
        public string DoctorName { get; set; }
        public string Specialization { get; set; }
        public string ContactNumber { get; set; }
        public string EmailAddress { get; set; }
        public string Qualification { get; set; }
        public DateTime JoiningDate { get; set; }
        public bool IsSurgeon { get; set; }

        // Foreign Key
        public int HospitalID { get; set; }

        // Navigation properties
        public HospitalMaster Hospital { get; set; }
        public ICollection<Patient> Patients { get; set; }
    }

}
