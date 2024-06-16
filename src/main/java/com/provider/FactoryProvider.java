package com.provider;

import org.hibernate.cfg.*;
import org.hibernate.SessionFactory;

public class FactoryProvider {

	public static SessionFactory factory;

	public static SessionFactory getFactory() {

		if (factory == null) {
			factory = new Configuration().configure().buildSessionFactory();
		}

		return factory;
	}

	public void closeFactory() {
		if (factory.isOpen()) {
			factory.close();
		}
	}

}
