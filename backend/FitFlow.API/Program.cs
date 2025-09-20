using FitFlow.API;
using FitFlow.API.Data;
using FitFlow.API.Dtos;
using FitFlow.API.Entities;
using FitFlow.API.Extensions;
using FitFlow.API.Repositories;
using FitFlow.API.Services;

var builder = WebApplication.CreateBuilder(args);

// Services & DI
builder.Services.AddScoped<IBaseRepository<ProgramEntity>, ProgramRepository>();
builder.Services.AddScoped<IBaseRepository<UserEntity>, UserRepository>();
builder.Services.AddScoped<IBaseRepository<SessionEntity>, SessionRepository>();
builder.Services.AddScoped<IBaseRepository<BlocEntity>, BlocRepository>();

builder.Services.AddScoped<IBaseService<UserEntity, UserDto>, UserService>();
builder.Services.AddScoped<IBaseService<ProgramEntity, ProgramDto>, ProgramService>();
builder.Services.AddScoped<IBaseService<SessionEntity, SessionDto>, SessionService>();
builder.Services.AddScoped<IBaseService<BlocEntity, BlocDto>, BlocService>();


builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDatabase(builder.Configuration, builder.Environment);

// --- AutoMapper ---
builder.Services.AddAutoMapper(typeof(MappingProfile));


builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});


var app = builder.Build();
app.UseCors();



// Middlewares
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();

    // Peupler la base InMemory au démarrage
    using (var scope = app.Services.CreateScope())
    {
        var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
        DataSeeder.SeedDatabase(context);
    }
}

app.UseAuthorization();
app.MapControllers();
app.Run();