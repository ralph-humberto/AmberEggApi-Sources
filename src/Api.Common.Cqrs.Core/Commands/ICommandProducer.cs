﻿using Api.Common.Cqrs.Core.Entities;
using System.Threading.Tasks;

namespace Api.Common.Cqrs.Core.Commands
{
    public interface ICommandProducer
    {
        Task<TEntity> Send<TCommand, TEntity>(TCommand command)
            where TCommand : ICommand
            where TEntity : IAggregateRoot;
    }
}