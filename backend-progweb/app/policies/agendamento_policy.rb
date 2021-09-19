class AgendamentoPolicy < ApplicationPolicy
  
  def index?
    user.qualquer_tipo?
  end

  def show?
    index?
  end

  def create?
    user.paciente? || user.admin?
  end
  
  def update?
    user.qualquer_tipo?
  end
end