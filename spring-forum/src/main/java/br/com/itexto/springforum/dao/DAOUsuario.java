package br.com.itexto.springforum.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import br.com.itexto.springforum.entidades.Usuario;

@Component("daoUsuario")
public class DAOUsuario extends DAOBase<Usuario> {
	
	private List<Usuario> todos;
	
	public Usuario get(Long id) {
		for (Usuario usuario : list(-1,-1)) {
			if (usuario.getId() == id) {
				return usuario;
			}
		}
		return null;
	}
	
	public List<Usuario> list(int offset, int max) {
		if (todos == null) {
			todos = new ArrayList<Usuario>();
			String[] nomes = {"Henrique Lobo", "Kico", "Josu�", "Amadeus", "Carvalhinho", "John McCarty"};
			for (int i = 0; i < nomes.length; i++) {
				Usuario usuario = new Usuario();
				usuario.setNome(nomes[i]);
				usuario.setId(i + 1);
				usuario.setEmail(nomes[i] + "@spring.com");
				usuario.setEmail(usuario.getEmail().toLowerCase().replaceAll(" ", "_"));
				usuario.setLogin(nomes[i].replaceAll(" ", "_").toLowerCase());
				usuario.setSenha(usuario.getLogin());
				usuario.setTwitter("@" + usuario.getLogin());
				todos.add(usuario);
			}
		}
		return todos;
	}
	
	public void persistir(Usuario obj) {
		list(-1,-1).add(obj);
	}
	
	public void excluir(Usuario obj) {
		list(-1,-1).remove(obj);
	}
	
	public Class getClazz() {
		return Usuario.class;
	}
	
	
	
}