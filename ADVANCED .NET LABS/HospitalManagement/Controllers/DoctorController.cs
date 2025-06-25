using HospitalManagement.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HospitalManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorController : ControllerBase
    {
        private readonly HospitalManagementContext context;

        public DoctorController(HospitalManagementContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Doctors>>> GetAllDoctors()
        {
            var doctors = await context.Doctors.ToListAsync();
            return Ok(doctors);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Doctors>> GetDoctorById(int id)
        {
            var doctor = await context.Doctors.FindAsync(id);
            if (doctor == null)
            {
                return NotFound();
            }
            return Ok(doctor);
        }

        [HttpPost]
        public async Task<ActionResult<Doctors>> CreateDoctor(Doctors doc)
        {
            await context.Doctors.AddAsync(doc);
            await context.SaveChangesAsync();
            return Ok(doc);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Doctors>> UpdateDoctor(int id, Doctors doc)
        {
            if (id != doc.DoctorID)
            {
                return BadRequest();
            }

            context.Entry(doc).State = EntityState.Modified;
            await context.SaveChangesAsync();
            return Ok(doc);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<int>> DeleteDoctor(int id)
        {
            var doc = await context.Doctors.FindAsync(id);
            if (doc == null)
            {
                return NotFound();
            }

            context.Doctors.Remove(doc);
            await context.SaveChangesAsync();
            return Ok(id);
        }
    }

}
