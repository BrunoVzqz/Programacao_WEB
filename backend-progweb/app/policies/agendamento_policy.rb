class AgendamentoPolicy < ApplicationPolicy
  
  def index?
    user.profissional_da_saude? || user.paciente? || user.admin?
  end

  def show?
    index?
  end

  def create?
    user.paciente?
  end
  
  def update?
    user.profissional_da_saude? || user.paciente?
  end
end