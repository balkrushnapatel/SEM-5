using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HospitalManagement.Models;
using Newtonsoft.Json;

namespace HospitalManagement.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class HospitalController : ControllerBase
    {
        private readonly HospitalManagementContext context;
            
        public HospitalController(HospitalManagementContext context)
        {
            this.context = context;
        }

        [HttpGet]

        public async Task<ActionResult<List<HospitalMaster>>> GetHospitalDetails()
        {
            var data = await context.HospitalMasters.ToListAsync();
            return Ok(data);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<HospitalMaster>> GetHospitalById(int id)
        {
            var hospital = await context.HospitalMasters.FindAsync(id);
            if (hospital == null)
            {
                return NotFound();
            }
            return hospital;

        }

        [HttpPost]
        public async Task<ActionResult<HospitalMaster>> CreateHospital(HospitalMaster hst)
        {
            await context.HospitalMasters.AddAsync(hst);
            await context.SaveChangesAsync();
            return Ok(hst);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<HospitalMaster>> UpdateHospital(int id, HospitalMaster hst)
        {
            if (id != hst.HospitalId)
            {
                return BadRequest();
            }
            context.Entry(hst).State = EntityState.Modified;
            await context.SaveChangesAsync();
            return Ok(hst);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<HospitalMaster>> DeleteHospital(int id)
        {
            var hst = await context.HospitalMasters.FindAsync(id);
            if (hst == null)
            {
                return NotFound();
            }
            context.HospitalMasters.Remove(hst);
            await context.SaveChangesAsync();
            return Ok(id);
        }

        [HttpPost]
        public IActionResult Create([FromBody] HospitalMaster hst)
        {
            if (ModelState.IsValid)
            {
                var jsonOutput = JsonConvert.SerializeObject(hst, Formatting.Indented);

                return Ok(new{
                    Message = "Hospital Data Recieved And Serialized Successfully",
                    data = jsonOutput
                });
            }

            return BadRequest(ModelState);
        }
        [HttpPost("deserialize")]
        public IActionResult DeserializeHospital([FromBody] object jsonData)
        {
            try
            {
                string jsonString = jsonData.ToString();

                HospitalMaster hospital = JsonConvert.DeserializeObject<HospitalMaster>(jsonString);

                if (hospital == null)
                {
                    return BadRequest("Deserialization failed.");
                }

                return Ok(new
                {
                    Message = "JSON Deserialized Successfully",
                    Data = hospital
                });
            }
            catch (JsonException ex)
            {
                return BadRequest(new
                {
                    Error = "Invalid JSON format.",
                    Exception = ex.Message
                });
            }
        }

        [HttpGet("Success")]
        public IActionResult GetSuccess()
        {
            return Ok(new { Message = "API is working final" });
        }

        [HttpGet("Fail")]
        public IActionResult GetFailure()
        {
            throw new Exception("This is a text exception.");
        }

        #region Doctor Details (CRUD)
        public async Task<ActionResult<List<Doctors>>> GetDoctorDetails()
        {
            var data = await context.HospitalMasters.ToListAsync();
            return Ok(data);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Doctors>> GetDoctorById(int id)
        {
            var doctor = await context.HospitalMasters.FindAsync(id);
            if (doctor == null)
            {
                return NotFound();
            }
            return doctor;

        }

        [HttpPost]
        public async Task<ActionResult<Doctors>> CreateDoctor(Doctors dct)
        {
            await context.HospitalMasters.AddAsync(dct);
            await context.SaveChangesAsync();
            return Ok(dct);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<HospitalMaster>> UpdateHospital(int id, HospitalMaster hst)
        {
            if (id != hst.HospitalId)
            {
                return BadRequest();
            }
            context.Entry(hst).State = EntityState.Modified;
            await context.SaveChangesAsync();
            return Ok(hst);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<HospitalMaster>> DeleteHospital(int id)
        {
            var hst = await context.HospitalMasters.FindAsync(id);
            if (hst == null)
            {
                return NotFound();
            }
            context.HospitalMasters.Remove(hst);
            await context.SaveChangesAsync();
            return Ok(id);
        }
        #endregion Doctor Details (CRUD)

    }
}
