module MCMCTempering

import AbstractMCMC
import Distributions
import Random

include("adaptation.jl")
include("tempered.jl")
include("ladders.jl")
include("stepping.jl")
include("model.jl")
include("swapping.jl")
include("plotting.jl")

export tempered, TemperedSampler, plot_swaps, plot_ladders, make_tempered_model, get_tempered_loglikelihoods_and_params, make_tempered_loglikelihood, get_params

function AbstractMCMC.bundle_samples(
    ts::Vector,
    model::AbstractMCMC.AbstractModel,
    sampler::TemperedSampler,
    state::TemperedState,
    chain_type::Type;
    kwargs...
)
    AbstractMCMC.bundle_samples(ts, model, sampler.internal_sampler, state, chain_type; kwargs...)
end

end
