package kr.co.ezen.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.ezen.beans.AcademyMemberBean;
import kr.co.ezen.beans.MemberBean;
import kr.co.ezen.interceptor.CheckLoginInterceptor;
import kr.co.ezen.mapper.AcademyMemberMapper;
import kr.co.ezen.mapper.BlackListMapper;
import kr.co.ezen.mapper.BoardMapper;
import kr.co.ezen.mapper.FaqMapper;
import kr.co.ezen.mapper.KakaoMapper;
import kr.co.ezen.mapper.MemberMapper;
import kr.co.ezen.mapper.PayMapper;
import kr.co.ezen.mapper.ServiceCenterMapper;
import kr.co.ezen.mapper.SiteAcaAskMapper;
import kr.co.ezen.mapper.SiteAskMapper;

@Configuration
//Controller
@EnableWebMvc
@ComponentScan("kr.co.ezen.controller")
@ComponentScan("kr.co.ezen.dao")
@ComponentScan("kr.co.ezen.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer{
	
	@Value("${db.classname}")//oracle.jdbc.OracleDriver
	private String db_classname;
	
	@Value("${db.url}")
	private String db_url;
	
	@Value("${db.username}")
	private String db_username;
	
	@Value("${db.password}")
	private String db_password;
	
	@Autowired
	private MemberBean loginMemberBean;
	
	@Autowired
	private AcademyMemberBean loginAcademyMemberBean;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// TODO Auto-generated method stub
//		WebMvcConfigurer.super.addResourceHandlers(registry);
        registry
        .addResourceHandler("/**","board/**","faq/**","serviceBoard/**","member/**","academymember/**","blackList/**","pay/**")
        .addResourceLocations("/resources/"); 
	}
	
	//?????????????????? ?????? ?????? ???????????? ??? ??????
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		
		
		return source;
		
	}
	
	//Query?????? ?????? ????????? ???????????? ?????? ??????
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		
		SqlSessionFactoryBean fSessionFactory = new SqlSessionFactoryBean();
		fSessionFactory.setDataSource(source);
		
		SqlSessionFactory factory = fSessionFactory.getObject();
		
		return factory;
	}
	
	//MemberMapper ??????
	@Bean
	public MapperFactoryBean<MemberMapper> getUserMapper(SqlSessionFactory factory){
		MapperFactoryBean<MemberMapper> factoryBean = new MapperFactoryBean<MemberMapper>(MemberMapper.class);
				
		factoryBean.setSqlSessionFactory(factory);
				
		return factoryBean;
				
	}
	
	//????????????Mapper ??????
	@Bean
	public MapperFactoryBean<AcademyMemberMapper> getAcademyMemberMapper(SqlSessionFactory factory){
		MapperFactoryBean<AcademyMemberMapper> factoryBean = new MapperFactoryBean<AcademyMemberMapper>(AcademyMemberMapper.class);
							
		factoryBean.setSqlSessionFactory(factory);
							
		return factoryBean;
							
		}
			
		//
	
	
	//????????? ?????? ?????? properties ????????? ???????????? ????????? ?????????.
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
		
	}
	
	//????????? ??????
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		
		res.setBasenames("/WEB-INF/properties/error_message");
		return res;
	}
	
	//?????????????????????????????????????????? ?????? (upload/download ??????)
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		
		return new StandardServletMultipartResolver(); 
	}
	
	//Query ????????? ?????? ????????? ?????? - BoardMapper ??????
	@Bean
	public MapperFactoryBean<BoardMapper> getMapperFactoryBean(SqlSessionFactory factory) {
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		
		factoryBean.setSqlSessionFactory(factory);
		
		
		return factoryBean;
	}
	
	//FaqMapper ??????
	@Bean
	public MapperFactoryBean<FaqMapper> getFaqMapper(SqlSessionFactory factory){
		MapperFactoryBean<FaqMapper> factoryBean = new MapperFactoryBean<FaqMapper>(FaqMapper.class);
				
		factoryBean.setSqlSessionFactory(factory);
				
		return factoryBean;
				
	}
	
	//Query ????????? ?????? ????????? ??????(Mapper ??????) -- ???????????? Mapper??????
	@Bean
	public MapperFactoryBean<ServiceCenterMapper> getServiceCenterMapper(SqlSessionFactory factory){
		MapperFactoryBean<ServiceCenterMapper> factoryBean = new MapperFactoryBean<ServiceCenterMapper>(ServiceCenterMapper.class);
		
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean;
		
	}	
	
	
// ???????????? Mapper??????	
	@Bean
	public MapperFactoryBean<SiteAskMapper> getSiteAskMapper(SqlSessionFactory factory){
		MapperFactoryBean<SiteAskMapper> factoryBean = new MapperFactoryBean<SiteAskMapper>(SiteAskMapper.class);
		
		factoryBean.setSqlSessionFactory(factory); 
		
		return factoryBean;
		
	}
	
	//?????? ????????????
		@Bean
		public MapperFactoryBean<SiteAcaAskMapper> getSiteAcaAskMapper(SqlSessionFactory factory){
			MapperFactoryBean<SiteAcaAskMapper> factoryBean = new MapperFactoryBean<SiteAcaAskMapper>(SiteAcaAskMapper.class);
			
			factoryBean.setSqlSessionFactory(factory); 
			
			return factoryBean;
		}
		
	// ???????????? ( ??????????????? ????????? ????????? ???????????? ?????? ??????)
		// ?????? ?????? ????????? ????????? ??????????????? ??????????????? ?????? ?????????.(/**) 
		
		public void addInterceptors(InterceptorRegistry registry) {
			
			WebMvcConfigurer.super.addInterceptors(registry);	
			
				
			
			//CheckLoginInterceptor ?????? : ????????????, ????????????
			CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginMemberBean, loginAcademyMemberBean);
			
			InterceptorRegistration registration2 = registry.addInterceptor(checkLoginInterceptor);
			
			registration2.addPathPatterns("/**");// ???????????? ??????????????? ??????
//			registration2.excludePathPatterns("/serviceBoard/noticeBoardList"); // ???????????? ??????
			
		}
		
		//BlackListMapper ??????
		   @Bean
		   public MapperFactoryBean<BlackListMapper> getBlackListMapper(SqlSessionFactory factory){
		      MapperFactoryBean<BlackListMapper> factoryBean = new MapperFactoryBean<BlackListMapper>(BlackListMapper.class);
		      
		      factoryBean.setSqlSessionFactory(factory); 
		      
		      return factoryBean;
		      
		   } 
		   
		 //KakaoMapper ??????
		      @Bean
		      public MapperFactoryBean<KakaoMapper> getKakaoMapper(SqlSessionFactory factory){
		         MapperFactoryBean<KakaoMapper> factoryBean = new MapperFactoryBean<KakaoMapper>(KakaoMapper.class);
		               
		         factoryBean.setSqlSessionFactory(factory);
		               
		         return factoryBean;
		               
		      }
		 //payMapper??????
		  	@Bean
			public MapperFactoryBean<PayMapper> getPayMapper(SqlSessionFactory factory) {
				MapperFactoryBean<PayMapper> factoryBean = new MapperFactoryBean<PayMapper>(PayMapper.class);

				factoryBean.setSqlSessionFactory(factory);

				return factoryBean;

			}
}












