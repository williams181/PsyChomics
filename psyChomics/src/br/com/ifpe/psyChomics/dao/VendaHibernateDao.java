package br.com.ifpe.psyChomics.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.ifpe.psyChomics.model.ItemVenda;
import br.com.ifpe.psyChomics.model.Venda;

public class VendaHibernateDao {

    private static final String PERSISTENCE_UNIT = "PC";

    public void inserir(Venda venda) {

	EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
	EntityManager manager = factory.createEntityManager();

	manager.getTransaction().begin();

	for (ItemVenda item : venda.getListaItens()) {
	    manager.persist(item);
	}

	manager.getTransaction().commit();

	manager.close();
	factory.close();
    }

}

