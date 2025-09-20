using FitFlow.API.Entities;
using FitFlow.API.Services;
using Microsoft.AspNetCore.Mvc;

namespace FitFlow.API.Controllers
{
    public class BaseController<TEntity, TDto> : ControllerBase where TEntity : IEntity where TDto : IEntity
    {
        protected readonly IBaseService<TEntity, TDto> _service;

        public BaseController(IBaseService<TEntity, TDto> service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<TDto>>> GetAll()
        {
            var blocs = await _service.GetAllAsync();
            return Ok(blocs);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<TDto>> GetById(Guid id)
        {
            var bloc = await _service.GetByIdAsync(id);

            if (bloc == null)
                return NotFound();

            return Ok(bloc);
        }

        [HttpPost]
        public async Task<ActionResult<TDto>> Add([FromBody] TDto dto)
        {
            if (dto == null)
                return BadRequest();

            var createdBlocId = await _service.AddAsync(dto);
            dto.Id = createdBlocId;
            return CreatedAtAction(nameof(GetById), new { id = dto.Id }, dto);
        }

        [HttpPut()]
        public async Task<IActionResult> Update([FromBody] TDto dto)
        {
            await _service.UpdateAsync(dto);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public virtual async Task<IActionResult> Delete(Guid id)
        {
            await _service.DeleteAsync(id);
            return NoContent(); // 204 si succès
        }
    }
}