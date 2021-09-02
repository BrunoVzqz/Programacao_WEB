class UsuarioPolicy < ApplicationPolicy

  def create?
    true
  end

  def perfil?
    user.paciente?
  end

end